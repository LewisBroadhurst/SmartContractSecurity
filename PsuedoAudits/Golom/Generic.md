# Generic Code Faults & Risks

## [H-01] Bad math leads to a common reverting underflow

In the code below, we are defining the previous checkpoint with oldCheckpoint.

The problem is that if nCheckpoints is 0, then [nCheckpoints - 1] will cause an underflow, reverting the function.

```
function _writeCheckpoint( ...

    // @audit-info we have not checked that nCheckpoints is not 0, so this will cause an underflow if nCheckpoints is 0
    Checkpoint memory oldCheckpoint = checkpoints[toTokenId][nCheckpoints - 1];
    ...
}
```

This renders the delegation portion of the protocol impossible to implement for users.

### Recommended Mitigation Steps

Move code inside the if statement, will not affect the outcome and overcomes the overflow.

```
function _writeCheckpoint(...

    if (nCheckpoints > 0 && oldCheckpoint.fromBlock == block.number) {
        Checkpoint memory oldCheckpoint = checkpoints[toTokenId][nCheckpoints - 1];
        oldCheckpoint.delegatedTokenIds = _delegatedTokenIds;
    } ...
}
```

// Golom: VoteEscrowDelegation.sol

## [H-02] External call to functions leaves msg.sender as a protocol contract, not the user

In the following code, a user calls the `transferFrom` external function from the FE or ABI. 
This then routes through to `VoteEscrowDelegation.sol` -- meaning the msg.sender is actually the intermediate contract and not the user (who is tx.origin).

The require statement will therefore fail, meaning the delegation removal will fail.

```
contract TransferFrom {
    
    function transferFrom(...) external {
        _transferFrom(_from, _to, _tokenId, msg.sender);
    }
}

contract VoteEscrowDelegationSlice {

    // @audit - This function is called from a contract, not tx.origin which would be the actual user
    function _transferFrom(...) internal override {
        ...
        // remove the delegation
        this.removeDelegation(_tokenId);
        ...
    }

    function removeDelegation(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, 'VEDelegation: Not allowed');
        ...
    }
}
```

### Recommended Mitigation Steps
Make the removeDelegation function public and call it without changing the context (i.e. without changing msg.sender to the contract’s address).

Note that the code is probably overcomplicated here and is a NC/Low in itself. There are several different functions with the same functionality: transferFrom _transfer, safeTransfer, etc.

// Golom: VoteEscrowDelegation.sol

## [H-03] Misuse of function input parameter blocks correct contract function

When a user wants to add a vote escrow with the `addVoteEscrow` on `VoteEscrowDelegation.sol` then need to input a `_voteEscrow` parameter.

In the `addVoteEscrow` function, `pendingVoteEscrow` is the parameter that is passed into VE(), setting the contract's state to an incorrect ve variable.

```
function addVoteEscrow(address _voteEscrow) external onlyOwner {
    if (address(ve) == address(0)) {
        ve = VE(pendingVoteEscrow);
    } ...
}
```

Aside from incorrectly setting ve or not setting it at all, the `multiStakerClaim` will not be accessible to genuine users as they will not pass the require statement.

```
function multiStakerClaim(uint256[] memory tokenids, uint256[] memory epochs) public {
    require(address(ve) != address(0), 'VE not added yet');
    ...
}
```

### Recommended Mitigation Steps

Implementing the correct function parameter, `_voteEscrow`.

```
function addVoteEscrow(address _voteEscrow) external onlyOwner {
    if (address(ve) == address(0)) {
        ve = VE(_voteEscrow);
    } ...
}
```

// Golom: VoteEscrowDelegation.sol

## [H-04] Protocol harming side effects from if statement

On the `RewardDistributor.sol:addFee` function call, there is a sensible if statement that stops the minting of exess tokens.

Unfortunately this has the side effect of stopping the `addFee` function from working at all if the mint hits it's limit.

```
function addFee(address[2] memory addr, uint256 fee) public onlyTrader {
    if (rewardToken.totalSupply() > 1000000000 * 10**18) {
        // if supply is greater then a billion dont mint anything, dont add trades
        return;
    } 
    
    ...
    
    feesTrader[addr[0]][epoch] = feesTrader[addr[0]][epoch] + fee;
    feesExchange[addr[1]][epoch] = feesExchange[addr[1]][epoch] + fee;
    epochTotalFee[epoch] = epochTotalFee[epoch] + fee;
}
```

// Golom: RewardDistributor.sol

## [H-05] State variable not updated after attempted alteration

In the `_writeCheckpoint` we can see a reference to the `checkpoints` mapping, in which we get the oldCheckpoint and store it in memory.
We then attempt to change the delegatedTokenIds for the oldCheckpoint, which is successful.

The problem is that this update is not reflected in the state of the `VoteEscrowDelegation.sol` contract, so the code becomes redundant.

```
function _writeCheckpoint(...) internal {
    ...
    Checkpoint memory oldCheckpoint = checkpoints[toTokenId][nCheckpoints - 1];

    if (nCheckpoints > 0 && oldCheckpoint.fromBlock == block.number) {
        oldCheckpoint.delegatedTokenIds = _delegatedTokenIds;
        checkpoints[toTokenId][nCheckpoints - 1] = oldCheckpoint;
    } ...
}
```

### Recommended Mitigation Steps

Just need to ensure that the state of the contract is updated.

```
function _writeCheckpoint(...) internal {
    ...
    Checkpoint memory oldCheckpoint = checkpoints[toTokenId][nCheckpoints - 1];

    if (nCheckpoints > 0 && oldCheckpoint.fromBlock == block.number) {
        oldCheckpoint.delegatedTokenIds = _delegatedTokenIds;
    } ...
}
```

// Golom: VoteEscrowDelegation.sol

## [L-01] Delegated NFTs remain delegated even after being burnt

The problem with this is that it adds additional bloat to the system that is not needed, affecting the gas cost of the contracts execution.
There is also a limit of 500 NFTs that can be delegated at any one time, so you are removing the functionality if burned NFTs hit 500.

I really liked this as it shows a real understanding of what the function and protocol is aiming to do, and the hiccups it has in its execution.
Inspirational level of understanding.

## Summarising list for common faults & risks
- Poor use of function visibility (external, public, internal, private).
- Consider who is msg.sender. If we call an intermediate contract that now becomes msg.sender.
- Misuse of function parameters can block users access to relevant functions.
- Check math with great tests and manual calculation. Does it add up?
- Require/Revert functions can often have undesirable side effects.
- Performing operations in the incorrect order, ultimately causing side effects or protocol degredation.