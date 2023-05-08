# Solution

## Unstoppable
Here, we have some code that relies on internal accounting to ensure that the pools balance
in correct.

The problem is, the contract does not take into account that a user can send assets to the account
via the deposit function, that will bypass the contracts internal accounting mechanisms.

This will break the accounting and the flashLoan functionality in the contract.

## Naive Receiver
