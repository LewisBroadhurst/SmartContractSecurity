## Classic Re-entrancy Attack

Occurs when a function calls a low level function such as `.call` and the state is updated afterward.
Ideally, we want the state to be updated prior to low level calls [Checks, Effects, Interactions].

In the partial contracts below, we can see that the contract can get caught in a loop of sending
ETH as the attackers contract calls the previous one back before the state can be updated.
This will result in a serious loss of funds.

```solidity
    // ...
    function withdraw() external payable {
        (bool sent, ) = payable(msg.sender).call{value: balances[msg.sender]}("");
        if (!sent) revert();
        delete balances[msg.sender];
    }
```

```solidity
    // ...
    function withdraw() external {
        Vault(victim).withdraw();
    }
    

    receive() external payable {
        try Vault(victim).withdraw() {} catch {}
    }
```

## Cross Function Re-entrancy
## Cross Contract Re-entrancy
## Read Only Re-entrancy 

### Summary
It's all about state & how state can be 'stale' if we perform interactions before checks/effects.

#### The System
1. Always starts from an external call
2. Focus on state variables [Checks, Effects, Interactions] and how they can become 'stale'

Questions:
- How does the nonReentrant modifier work?
- Curve Pools...