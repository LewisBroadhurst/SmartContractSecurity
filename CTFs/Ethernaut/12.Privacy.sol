// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {

  bool public locked = true;
  uint256 public ID = block.timestamp;
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(block.timestamp);
  bytes32[3] private data;

  constructor(bytes32[3] memory _data) {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }
}

// How does the Hack work??

// Uses the fact that the evm will have stored the password in memory
// Just because the password is a private variable, doesn't mean it can't be accessed
// We can use knowledge of the evm to access the password, we can see it is held in storage slot 5
// Great diagram explaining this: https://www.goodbytes.be/blog/article/ethernaut-walkthrough-level-12-privacy

// await web3.eth.getStorageAt("0x531A5a19B5b64705f1094b585F972Fa031b82716", 5); => '0xb9e4d7fbe142a59d3e5dc7bdaef9d0a286724d01243fda48529547d410508a37'
// Then we cast to a bytes16 and pass it to the unlock function in our Hack contract