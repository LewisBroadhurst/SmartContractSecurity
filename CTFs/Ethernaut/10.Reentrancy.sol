// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import '../../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

// Contract Address: 0xe28A4AC67c5bbAaDb3D0491077af8dcF5bf4a946
// await getBalance('0xe28A4AC67c5bbAaDb3D0491077af8dcF5bf4a946') => '0.001'

// https://dev.to/nvn/ethernaut-hacks-level-10-re-entrancy-42o9