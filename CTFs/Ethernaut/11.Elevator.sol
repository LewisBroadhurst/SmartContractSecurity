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

// How does the Hack work??

// The exploit comes from calling the goTo function from our hacking contract
// This sets the building variable to the address of the hacking contract
// Here we can implement our own custom .isLastFloor function that will set the top boolean to true, overriding the interface isLastFloor function