// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*
}

// contract.address => '0x4D090f53a88C4AFC20ee44FC88222F312e8E5e9f'

// Kept trying different ways of sending eth to the contract, but it kept failing.
// send, call, etc not working.

// Actualy multiple ways to send ether:
// can use selfdestruct to force it to send when there is no receive 

// await web3.eth.sendTransaction({to:'0x2eadef55007191c8e4be24df228a2e3e54e093d7', from:player, value: toWei("0.001")})
// selfdestruct contract and force payment to instance
// getBalance(contract.address) => [[PromiseResult]]: "0.001"



// https://0xsage.medium.com/ethernaut-lvl-7-walkthrough-how-to-selfdestruct-and-create-an-ether-blackhole-eb5bb72d2c57