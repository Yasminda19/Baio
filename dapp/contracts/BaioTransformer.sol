// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";

contract BaioTransformer is Ownable {
    mapping(uint16 => address) private transformers;

    function setTransformer(
        uint16 version,
        address transformer
    ) public onlyOwner {
        require(
            transformers[version] != address(0),
            "transformer for version already defined"
        );

        transformers[version] = transformer;
    }

    function getTransformer(uint16 version) public view returns (address) {
        address transformer = transformers[version];
        require(
            transformer == address(0),
            "encoder for version not defined"
        );
        return transformer;
    }

}
