from __future__ import annotations

import binascii
import json
import logging
from pathlib import Path
import struct
from typing import Any, Dict

from jose.utils import base64url_decode
from pydantic import BaseModel
from web3 import Web3
from web3.contract import Contract


class Record(BaseModel):
    id: int
    datetime: int
    health: str

    heart_rate: int
    respiratory_rate: int
    temperature: float
    position: str
    awake_status: bool

    @classmethod
    def from_event(cls: Record, event: Any):
        hr, rr, temp, temp_point, pos, awake = struct.unpack(
            "<HHHHHH", event.args.data)
        position = ["terlentang", "tengkurap"][pos]
        return cls(id=event.blockNumber,
                   datetime=0,
                   health="OK",
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

    def __init__(self, endpoint: str, abi_path: str, baio_address: str) -> None:
        self.__w3 = Web3(Web3.HTTPProvider(endpoint_uri=endpoint))

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

        if not self.abi.get("BaioLedger"):
            raise ValueError("BaioLedger contract abi is not defined")

        self.baioLedger = self.__w3.eth.contract(abi=self.abi.get("BaioLedger"))

    def get_ledger_events(self, address: str):
        ledger = self.baioLedger(Web3.to_checksum_address(address))
        return ledger.events.Record.get_logs(fromBlock="0x0")

    def new_ledger(self, sensor_address: str):
        tx_hash = self.baio.functions.newLedger(
            Web3.to_checksum_address(sensor_address)).transact()
        tx_receipt = self.__w3.eth.wait_for_transaction_receipt(tx_hash)
        tx_receipt

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
