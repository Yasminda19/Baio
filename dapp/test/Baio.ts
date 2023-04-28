import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Baio", function () {
  async function deploy() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const Baio = await ethers.getContractFactory("Baio");
    const baio = await Baio.connect(owner).deploy();

    await baio.deployed();

    const tx = await baio.connect(owner).newLedger(otherAccount.address);
    await tx.wait();

    const ledgerAddress = await baio.getLedger(otherAccount.address);
    const ledger = await ethers.getContractAt("BaioLedger", ledgerAddress);

    return { baio, ledger, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should have owner as Baio owner address", async function () {
      const { baio, owner } = await loadFixture(deploy);

      expect(await baio.owner()).to.equal(owner.address);
    });

    it("Should have otherAccount as Ledger owner address", async function () {
      const { ledger, otherAccount } = await loadFixture(deploy);

      expect(await ledger.owner()).to.equal(otherAccount.address);
    });
  });

  describe("Logging", function () {
    // it("Should fail to log as owner with ledger", async function () {
    //   const { ledger, owner } = await loadFixture(deploy);
    // });
    it("Should be able to log as otherAccount with ledger", async function () {
      const { ledger, otherAccount } = await loadFixture(deploy);

      const raw = "0x6c6d616f";
      const data = ethers.utils.arrayify(raw);
      const tx = await ledger.connect(otherAccount).store(1, data);
      const res = await tx.wait();

      expect(res.events?.[0].args?.[1]).to.equal(raw);
    });
  });
});
