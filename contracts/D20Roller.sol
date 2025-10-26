// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract D20Roller {
    event Rolled(address indexed player, uint256 result);

    function roll() external returns (uint256) {
        uint256 result = (uint256(
            keccak256(abi.encodePacked(block.timestamp, msg.sender, block.prevrandao))
        ) % 20) + 1;
        emit Rolled(msg.sender, result);
        return result;
    }
}
