from __future__ import annotations

import binascii
import json
import logging
from pathlib import Path
import struct
from typing import Any, Dict

from eth_account import Account
from eth_account.signers.local import LocalAccount
from eth_typing import ChecksumAddress
from jose.utils import base64url_decode
from pydantic import BaseModel
import ring
from web3 import Web3
from web3.contract import Contract


class Record(BaseModel):
    datetime: int
    health: str

    heart_rate: int
    respiratory_rate: int
    temperature: float
    position: str
    awake_status: bool

    @classmethod
    def from_event(cls: Record, event: Any):
        datetime, hr, rr, temp, temp_point, pos, awake = struct.unpack(
            "<IHHHHHH", event.args.data)
        position = ["TERLENTANG", "TENGKURAP"][pos]
        temperature = temp + temp_point / 100
        health = "NOT OK"
        if rr >= 95 and (temperature > 35.8 and
                         temperature < 38) and (hr > 100 and hr < 160):
            health = "OK"

        return cls(datetime=datetime,
                   health=health,
                   heart_rate=hr,
                   respiratory_rate=rr,
                   temperature=temp + temp_point / 100,
                   position=position,
                   awake_status=awake)


class BaioDApp:
    __w3: Web3
    logger = logging.getLogger(__name__)
    abi: Dict[str, Any]
    baio: Contract
    baioLedger: Contract
    endpoint: str

    def __init__(self, endpoint: str, abi_path: str, baio_address: str,
                 master_key: str) -> None:
        self.__w3 = Web3(Web3.HTTPProvider(endpoint_uri=endpoint))
        self.endpoint = endpoint

        path = Path(abi_path)
        if not path.is_file():
            raise RuntimeError("Baio ABIs is not defined")
        with path.open("r") as f:
            self.abi = json.load(f)

        if not self.abi.get("Baio"):
            raise ValueError("Baio contract abi is not defined")

        self.baio = self.__w3.eth.contract(
            Web3.to_checksum_address(baio_address),
            abi=self.abi.get("Baio"),
        )

        account: LocalAccount = Account.from_key(master_key)
        self.__w3.eth.default_account = account.address

        if self.baio.caller.owner() != account.address:
            raise ValueError("Master Account is not Baio contract owner")

        if not self.abi.get("BaioLedger"):
            raise ValueError("BaioLedger contract abi is not defined")

        self.baioLedger = self.__w3.eth.contract(abi=self.abi.get("BaioLedger"))

    def __ring_key__(self):
        return self.endpoint

    @ring.lru(maxsize=16)
    def get_ledger_address(self, address: str) -> ChecksumAddress:
        return self.baio.caller.getLedger(Web3.to_checksum_address(address))

    def get_ledger_events(self, address: str):
        ledgerAddress = self.get_ledger_address(address)
        ledger = self.baioLedger(ledgerAddress)
        return ledger.events.Record.get_logs(fromBlock="0x0")

    def new_ledger(self, sensor_address: str):
        tx_hash = self.baio.functions.newLedger(
            Web3.to_checksum_address(sensor_address)).transact()
        tx_receipt = self.__w3.eth.wait_for_transaction_receipt(tx_hash)
        return tx_receipt

    def _load(self, token):
        if isinstance(token, str):
            token = token.encode("utf-8")

        try:
            claims_segment, crypto_segment = token.rsplit(b".", 1)
        except ValueError:
            raise ETHSigError("Not enough segments")
        except (TypeError, binascii.Error):
            raise ETHSigError("Invalid header padding")

        try:
            payload = base64url_decode(claims_segment)
        except (TypeError, binascii.Error):
            raise ETHSigError("Invalid payload padding")

        try:
            signature = base64url_decode(crypto_segment)
        except (TypeError, binascii.Error):
            raise ETHSigError("Invalid crypto padding")

        return (payload, signature)

    def decode(self, token: str) -> Dict[str, Any]:
        message, signature = self._load(token)

        payload = json.loads(message)

        issuer = payload.get("iss")
        if issuer is None:
            raise ValueError("Invalid issuer")

        recovered = self.__w3.eth.account.recover_message(message, signature)

        if issuer != recovered:
            raise ValueError("Invalid issuer")

        return payload


class ETHSigError(Exception):
    pass
