## [H-01] Not checking the return value of a call

This can become problematic when the recipient is a smart contract that reverts (for instance, temporarily) in its receive function. 

The contract assumes that this ETH was transferred out and sets the balance to 0, although no ETH was transferred. This leads to a loss of funds for the recipient.

```
// bad 
payable(msg.sender).call{value: contribution}("");

// good
(bool success, ) = payable(msg.sender).call{value: contribution}("");
```

### Proof Of Concept
We assume that the recipient is a smart contract that performs some logic in its receive function. For instance, it can be a nice feature for some people to automatically convert all incoming ETH into another token using an AMM. However, it can happen that the used AMM has too little liquidity at the moment or the slippage of a swap would be too high, leading to a revert in the receing contract. In such a scenario, the GroupBuy contract still thinks that the call was succesful, leading to lost funds for the recipient.

### How can I find this vulnerability easily?
- Find and check every call instance in a project