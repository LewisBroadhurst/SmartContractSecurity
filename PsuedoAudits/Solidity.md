# Solidity Code Faults & Risks

## [M-01] Use safeTransferFrom instead of transferFrom for ERC721

Using the transferFrom method for ERC721 transfer is discouraged, and it is recommended to use safeTransferFrom whenever possible by OpenZeppelin.
If the OpenZeppelin contract has already been imported to the contract then there is no excuse.

In this particular case, it is clear that the code for `transferFrom` & `safeTransferFrom` is massively overcomplicated for the functionality it is implementing.
Consider a re-write of this code.

`safeTransferFrom` checks that the receiving address is able to receive ERC721 tokens prior to sending the ERC721.
More info can be found here: https://docs.openzeppelin.com/contracts/3.x/api/token/erc721.

// Golom: GolomTrader.sol

## [L-01] Use `call()` rather than `transfer()` on payable address

Always avoid uses of `.transfer()` to send ether to other addresses. There are a number of issues with using .transfer(), 
as it can fail for a number of reasons:
- The destination is a smart contract that doesn’t implement a payable function, or it implements a payable function which uses more than 2300 gas units.
- The destination is a smart contract that doesn’t implement a payable fallback function, or it implements a payable fallback function which uses more than 2300 gas units.
- The destination is a smart contract that is called via an intermediate proxy contract, increasing the case requirements to more than 2300 gas units. An example of unknown destination complexity is a multisig wallet that as part of its operation uses more than 2300 gas units.
- Future changes or forks in Ethereum result in higher gas fees than transfer provides. The .transfer() creates a hard dependency on the transfer using less than 2300 gas units.

### Recommended Mitigation Steps

Simply implementing the `.call()` method over `.transfer()`.

```
// Bad practise
payable(payAddress).transfer(msg.value);

// Good practise
(bool success, ) = payable(payAddress).call{value: msg.value}("");
require(success, "Transfer failed.");
```

// Golom: GolomTrader.sol
