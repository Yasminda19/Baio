from __future__ import annotations

import argparse
import json
import random
import struct
import time
from configparser import ConfigParser
from dataclasses import dataclass
from datetime import datetime
from typing import Any, Literal

import cv2
import requests
from eth_account import Account
from eth_account.signers.local import LocalAccount
from web3 import HTTPProvider, Web3
from web3.contract.contract import Contract
from web3.middleware import construct_sign_and_send_raw_middleware


@dataclass
class Record:
    datetime: int
    # health: Literal["OK", "NOT_NORMAL"]
    heart_rate: int
    respiratory_rate: int
    temperature: float
    position: Literal["TELENTANG", "TENGKURAP"]
    awake_status: bool

    @property
    def position_num(self):
        if self.position == "TELENTANG":
            return 0
        elif self.position == "TENGKURAP":
            return 1        
        raise ValueError("invalid position")

    def __bytes__(self) -> bytes:
         temp = int(self.temperature)
         temp_point = ((int(self.temperature) - temp) * 100) // 100

         return struct.pack(
            "<IHHHHHH",
            self.datetime,
            self.heart_rate,
            self.respiratory_rate,
            temp,
            temp_point,
            self.position_num,
            self.awake_status,
        )

class Ledger:
    w3: Web3
    ledger: Contract
    _account: LocalAccount

    def __init__(self, rpc: str, baio_address: str, priv_key: str) -> None:
        with open("abi.json") as f:
            abi = json.load(f)

        self.w3 = Web3(HTTPProvider(rpc))
        account: LocalAccount = Account.from_key(priv_key)
        self.w3.middleware_onion.add(
            construct_sign_and_send_raw_middleware(account))
        baio = self.w3.eth.contract(address=Web3.to_checksum_address(baio_address), abi=abi["Baio"])

        try:
            ledger_address = baio.caller.getLedger(account.address)
            self.ledger = self.w3.eth.contract(address=ledger_address, abi=abi["BaioLedger"])
        except ValueError:
            raise ValueError(f"No ledger found for {account.address}. Register first!")

        self.w3.eth.default_account = account.address

    def store(self, record: Record) -> None:
        txn = self.ledger.functions.store(1, bytes(record)).build_transaction()
        self.w3.eth.send_transaction(txn)

def setup():
    parser = argparse.ArgumentParser("baio-client")
    parser.add_argument("--sensor", type=str, action="store", required=True)
    parser.add_argument("--camera-id", type=int, action="store", required=True)
    parser.add_argument("--debug", action="store_true")
    return parser.parse_args()


def main():
    with open("config.json") as f:
        config = json.load(f)

    args = setup()

    accts = config["accounts"]
    for acct in accts:
        if acct["name"] == args.sensor:
            break
    else:
        raise ValueError("no sensor config found")

    with open(acct["private_key"]) as f:
        key = f.read()

    ledger = Ledger(config["server"]["rpc"], config["server"]["baioAddress"], key)


    # txn = ledger.ledger.functions.store(1, bytes(rec)).build_transaction()

    # print(ledger.w3.eth.send_transaction(txn))

    cam = cv2.VideoCapture(args.camera_id)
    while True:
        ret, img = cam.read()
        if not ret:
            print("error: can't capture image")
            continue

        rec = Record(
            datetime=int(datetime.now().timestamp()),
            heart_rate=random.randint(65, 170),
            respiratory_rate=random.randint(85, 100),
            temperature=35.5 + random.random() * 4.5,
            position=random.choice(["TELENTANG", "TENGKURAP"]),
            awake_status=random.randint(0, 1),
        )

        res = cv2.imwrite("live.jpeg", img)

        print("Uploading image ...")
        with open("live.jpeg", "rb") as fimg:
            res = requests.post(
                f"{config['server']['api']}/api/v1/sensors/{str(ledger.w3.eth.default_account)}/live.jpeg",
                files={
                    "photo": ("live.jpeg", fimg, "image/jpeg"),
                })
        print(f"Upload {'OK' if res.ok else 'FAILED'}")

        ledger.store(rec)

        time.sleep(30)


if __name__ == "__main__":
    main()
