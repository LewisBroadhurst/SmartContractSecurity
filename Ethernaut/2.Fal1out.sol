// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Fallout {
  
  using SafeMath for uint256;
  mapping (address => uint) allocations;
  address payable public owner;


  /* constructor */
  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
  }

  modifier onlyOwner {
	        require(
	            msg.sender == owner,
	            "caller is not the owner"
	        );
	        _;
	    }

  function allocate() public payable {
    allocations[msg.sender] = allocations[msg.sender].add(msg.value);
  }

  function sendAllocation(address payable allocator) public {
    require(allocations[allocator] > 0);
    allocator.transfer(allocations[allocator]);
  }

  function collectAllocations() public onlyOwner {
    msg.sender.transfer(address(this).balance);
  }

  function allocatorBalance(address allocator) public view returns (uint) {
    return allocations[allocator];
  }
}

// Contract instance: "0xc1781F372ecD3440c19a9D800A0988d1104b377e"

// web3.eth.getBalance("0xc1781F372ecD3440c19a9D800A0988d1104b377e") => "0"

// contract.Fal1out({value: toWei("0.1")}) => tx: "0x85264283f8596ba4cd951856f3c923825c64095aa9d37619279c5f8d9b72fd73"

// await contract.owner() => '0x319d567611c5a1017BA081e2B27B7c7b57e1797d'

// await web3.eth.getBalance("0xc1781F372ecD3440c19a9D800A0988d1104b377e") => '100000000000000000'