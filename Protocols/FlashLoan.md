## Flash Loans
Special transactions that allow the borrowing of an asset, as long as the `borrowed amount + fee` is returned before
the end of the transaction (also known as one block borrows). Hence, `flash` loans.

These transactions do not require a user to supply collateral prior to engaging in the transaction. There is no real
world analogy to Flash Loans, and therefore requires an understanding of how state is managed within blocks in
blockchains.

### Overview
Allows users to access liquidity in a liquidity pool for 1 transaction, as long as one of the two conditions are
fulfilled:
1. `Amount taken + fee is returned` 
2. `The debt position is opened`

Aave V3 offers two options for flash loans:
1. `flashLoan`: allows borrowers to access liquidity of multiple reserves in a single flashLoan transaction. Borrowers
also have the option to open a stable or varied rate debt postion backed by supplied collateral or credit delegation.


2. `flashLoanSimple`: allows borrowers to access liquidity of a single reserve for the transaction. The borrower
cannot open any debt position at the end of the transaction. The benefit is a gas efficient transaction.

