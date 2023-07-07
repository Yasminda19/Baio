import "@nomicfoundation/hardhat-toolbox";
import { HardhatUserConfig } from "hardhat/config";

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  networks: {
    localstack: {
      url: "http://0.0.0.0:8545",
      accounts: [
        "0x6d1d883be88db72bfb33b6a32b5421a47b0e7fe26304938dbe1688ac279356b5",
        "0xe390ba782cca7cf9f74a12e4f8360e2c7e02ef842739ffff5ae9628ff3b58c0a",
      ],
    },
  },
};

export default config;
