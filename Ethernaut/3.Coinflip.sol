// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlip {

  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    /*
    Blockhash is a global variable that takes blocknumber and returns hash of the given block when blocknumber is one of the 256 most recent blocks; otherwise returns zero.

    block.number.sub(1) returns the block number of the last block. Why the last one, not the current one? Because at the time the function is called, the current block is not yet mined.
    */

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}

// contract.address => '0xC2789fe7Bb1fE0467d1Be603c0206dB99BB2e811'
// See Attack.Coinflip.sol for attack code