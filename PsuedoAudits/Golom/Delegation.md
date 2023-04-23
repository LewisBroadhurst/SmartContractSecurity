# Delegation Risks

## [H-01] Unlimited delegations from 1 token possible

The delegate function correctly delegates the token but does not check/remove other delegations! This means that any token can be continuously delegated an unlimited number of times.

```
function delegate(uint256 tokenId, uint256 toTokenId) external {
    
    // sets the mapping representing tokenId has been delegated to toTokenId
    delegates[tokenId] = toTokenId;
    
}
```

### Proof of Concept

Steve owns a token (ID = 1) and has a balance of 1000.
He calls the delegate function as so: `delegate(1, 2)`.
Steve has now delegated his voting power to token 2.

Steve now accidentally* calls the delegate function again: `delegate(1, 3)`.
*or he notices the exploit in the contract.

He notices that he is able to delegate twice and continues to try this exploit.
Suddenly steve has delegated his voting power to 1000 different tokens.
Steve can buy another token or work with Craig to freely spam delegate.
Other users notice what is happening and exploit the contract as well.

### Recommended Fix

Check the token has not been delegated previously, and if it has, remove that previous delegation before it is reassigned.

```
if (delegates[tokenId] != 0) {
    removeDelegation(tokenId);
}
```

// Golom: VoteEscrowDelegation.sol

## [H-02]



## Summarising list for common delegation faults & risks
- Not removing delegation ability when reassigning delegation.