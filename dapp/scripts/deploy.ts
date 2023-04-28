import { ethers } from "hardhat";

async function main() {
  const [owner, otherAccount] = await ethers.getSigners();
  // console.log(owner.address, otherAccount.address);

  const Baio = await ethers.getContractFactory("Baio");
  const baio = await Baio.connect(owner).deploy();

  await baio.deployed();

  let tx = await baio.connect(owner).newLedger(otherAccount.address);
  await tx.wait();

  const ledgerAddress = await baio
    .connect(owner)
    .getLedger(otherAccount.address);
  const ledger = await ethers.getContractAt("BaioLedger", ledgerAddress);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
