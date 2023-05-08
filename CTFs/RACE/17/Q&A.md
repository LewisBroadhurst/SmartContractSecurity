[Q1] deposit() can revert:
(A): If insufficient ETH was sent with the call
(B): If the caller has insufficient WETH balance
(C): With the "cap exceeded" error
(D): If called internally

A) A, B

[Q2] What issues pertain to the deposit() function?
(A): Funds can be drained through re-entrancy
(B): Accounting mismatch if user specifies amount > msg.value
(C): Accounting mismatch if user specifies amount < msg.value
(D): totalContributionCap isn't enforced on an individual level

A) C

[Q3] Which of the following is/are true about withdraw()?
(A): Funds can be drained through re-entrancy
(B): Funds can be drained due to improper amount accounting in deposit()
(C): Assuming a sufficiently high gas limit, the function reverts from the recipient (caller) consuming all forwarded gas
(D): May revert with "failed to transfer ETH"

A) D

[Q4] Which of the following parameters are correctly emitted in the ContributorsUpdated() event?
(A): newContributor
(B): oldNumContributors
(C): newNumContributors
(D): None of the above

A) A

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