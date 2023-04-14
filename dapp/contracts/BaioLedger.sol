// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BaioLedger is Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _recordIds;

    event Record(
        bytes data
    );

    function getTotalRecords() public view returns (uint256) {
        return _recordIds.current();
    }

    function store(
        bytes calldata data
    ) public onlyOwner {
        emit Record(
            data
        );

        _recordIds.increment();
    }
}
