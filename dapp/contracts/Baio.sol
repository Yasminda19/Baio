// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./BaioLedger.sol";

contract Baio is Ownable {
    mapping (address => address) ledgers;
    address[] owners;

    function newLedger(address owner) public onlyOwner returns (address) {
        BaioLedger ledger = new BaioLedger();
        ledger.transferOwnership(owner);
        ledgers[owner] = address(ledger);
        owners.push(owner);
        return address(ledger);
    }

    function getLedger(address owner) public view returns (address) {
        require (ledgers[owner] == address(0), "Empty ledger");
        return ledgers[owner];
    }
}