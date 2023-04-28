import json
import logging
from pathlib import Path
from typing import Dict, List

from web3 import AsyncWeb3
from web3 import contract
from web3 import Web3


class BaioDApp:
    w3: AsyncWeb3
    logger = logging.getLogger(__name__)
    abi: Dict

    def __init__(self, endpoint: str, abi_path: str) -> None:
        self.w3 = AsyncWeb3(AsyncWeb3.AsyncHTTPProvider(endpoint_uri=endpoint))

        self.abi = {}
        abi_root = Path(abi_path)
        for file in abi_root.iterdir():
            if file.is_file() and file.name.endswith(".json"):
                with file.open("r") as f:
                    self.abi[file.name] = json.load(f)

    async def get_ledger_events(self, address: str):
        abi = self.abi.get("BaioLedger")
        contract = self.w3.eth.contract(
            Web3.to_checksum_address(address),
            abi=abi,
        )

    async def new_ledger(self, sensor_address: str):
        abi = self.abi.get("Baio")
