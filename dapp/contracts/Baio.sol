// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./BaioLedger.sol";
import "./BaioTransformer.sol";
// import "hardhat/console.sol";

contract Baio is Ownable, BaioTransformer {
    mapping (address => address) private ledgers;
    address[] private owners;

    constructor () Ownable() BaioTransformer() {}

    function newLedger(address owner_) public onlyOwner returns (address) {
        BaioLedger ledger = new BaioLedger();
        ledger.transferOwnership(owner_);
        ledgers[owner_] = address(ledger);
        owners.push(owner_);
        return address(ledger);
    }

    function getLedger(address owner_) public view returns (address) {
        require (ledgers[owner_] != address(0), "Empty ledger");
        return ledgers[owner_];
    }
}
