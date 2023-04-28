// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract BaioTrasnformerV1 {
    function encode() public pure returns (bytes memory) {
        bytes memory data = new bytes(10);
        return data;
    }

    function decode(bytes calldata data) public pure returns (uint16, bytes memory) {
        return (1, data);
    }
}