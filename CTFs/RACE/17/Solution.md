[Q1] deposit() can revert:
(A): If insufficient ETH was sent with the call
(B): If the caller has insufficient WETH balance
(C): With the "cap exceeded" error
(D): If called internally

A) A, B
How does it revert for "If insufficient ETH was sent with the call"?
- If amount is 0 and the msg.value is > 0, the deposit will likely fail.

How does it revert for "If the caller has insufficient WETH balance"?
- If no ether was provided vis msg.value and the caller has insufficient ETH, then
WETH.transferFrom() is likely to revert.

Why does it not revert from the "cap exceeded" error?
- There is an overflow caused by the fact that totalContributions is a unit72. It
will never reach the TOTAL_CONTRIBUTION_COUNT because the uint72 type will not 
allow it.

What would happen if deposit was called internally?
- Attempts to call external contracts internally will not compile. They can be called
by using this.deposit(), which would call the contract like it was an external contract.


[Q2] What issues pertain to the deposit() function?
(A): Funds can be drained through re-entrancy
(B): Accounting mismatch if user specifies amount > msg.value
(C): Accounting mismatch if user specifies amount < msg.value
(D): totalContributionCap isn't enforced on an individual level

A) C

Why can funds not be drained via re-entrancy?
- Re-entrancy requires unsafe external calls to be made. All calls are made to the 
trusted WETH contract, which has no sender callbacks/hooks.

Why would an accounting mismatch if user specifies amount > msg.value not revert?
- If msg.value is less than amount, the function will revert, resulting with no
real issues. This will be caused by the if statement, as the deposit amount can not
be filled by a smaller msg.value.

Why does amount < msg.value lead to an accounting mismatch?
- If the msg.value is higher than the amount, it will transfer x (msg.value - amount),
leaving y behind in the contract. Other users could then take this excess value.

Why is totalContributionCap not a med/high risk?
- The totalContributionCap will never be hit, as the uint72 will be plagued by overflow
reverts.

[Q3] Which of the following is/are true about withdraw()?
(A): Funds can be drained through re-entrancy
(B): Funds can be drained due to improper amount accounting in deposit()
(C): Assuming a sufficiently high gas limit, the function reverts from the recipient (caller) consuming all forwarded gas
(D): May revert with "failed to transfer ETH"

A) D

Why can funds not be drained through re-entrancy?
- The function follows the checks - effects - interactions pattern. 

May revert with "failed to transfer ETH"?
- This would fail if the contract lacks a payable receive/fallback function

[Q4] Which of the following parameters are correctly emitted in the ContributorsUpdated() event?
(A): newContributor
(B): oldNumContributors
(C): newNumContributors
(D): None of the above

A) A
The event emitted uses incorrect values. If 

[Q5] The vault deployer can pause the following functions:
(A): deposit()
(B): withdraw()
(C): requestAllowance()
(D): None of the above

A) A, B

[Q6] What is the largest possible allowance given to the controller?
(A): 40% of totalContributionCap
(B): 60% of totalContributionCap
(C): 100% of totalContributionCap
(D): Unbounded

A) D

[Q7] The requestAllowance() implementation would have failed after the 1st call for tokens that only allow zero to non-zero allowances. Which of the following mitigations do NOT work?
(A): safeApprove(0) followed by safeApprove(type(uint256).max)
(B): safeIncreaseAllowance(type(uint256).max)
(C): safeIncreaseAllowance(0) followed by safeIncreaseAllowance(type(uint256).max)
(D): safeDecreaseAllowance(0) followed by safeApprove(type(uint256).max)

A) B, C, D

[Q8] Which of the following gas optimizations are relevant in reducing runtime gas costs for the vault contract?
(A): Changing ALLOWANCE_CAP type from immutable to constant, ie. uint256 public constant ALLOWANCE_CAP = 40 * uint256(TOTAL_CONTRIBUTION_CAP) / 100;
(B): Increase number of solc runs (assuming default was 200 runs)
(C): Renaming functions so that the most used functions have smaller method IDs
(D): Use unchecked math in withdraw()

A) A