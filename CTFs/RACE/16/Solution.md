[Q1] Which of the following is an explanation of why flashLoan() could revert?
(A): The transaction reverts because a user requested to borrow more than maxFlashLoan()
(B): The transaction reverts because the receiver’s onFlashLoan() did not return CALLBACK_SUCCESS
(C): The transaction reverts because the user returned more than retAmt funds
(D): The transaction reverts because a user tried to spend more funds than their allowance in onFlashLoan()

[Q2] If the FlashLoan contract were safe, which of the following invariants should hold at the end of 
any given transaction for some ERC20 token t? Note: old(expr) evaluates expr at the beginning of the 
transaction.
(A): t.balanceOf(address(this)) >= old(t.balanceOf(address(this)))
(B): t.balanceOf(address(this)) == old(t.balanceOf(address(this)))
(C): t.balanceOf(address(this)) > old(t.balanceOf(address(this)))
(D): t.balanceOf(address(this)) == old(t.balanceOf(address(this))) + fee

[Q3] Which of the following tokens would be unsafe for the above contract to loan as doing so could 
result in theft?
(A): ERC223
(B): ERC677
(C): ERC777
(D): ERC1155

[Q4] Which external call made by flashLoan() could result in theft if the token(s) identified in the
previous question were to be used?
(A): onFlashLoan()
(B): balanceOf()
(C): transferFrom()
(D): approve()

[Q5] What is the purpose of the fee in the FlashLoan contract as is?
(A): To increase the size of available flashloans over time
(B): To pay the owner of the flashloan contract
(C): To pay those who staked their funds to be flashloaned
(D): It has no purpose

[Q6] Which of the following describes the behavior of maxFlashLoan for a standard ERC20 token over time?
(A): Strictly-increasing
(B): Non-decreasing
(C): Constant
(D): None of the above

[Q7] For some arbitrary ERC20 token t, which of the following accurately describes the FlashLoan 
contract's balance of t after a successful (i.e. non-reverting) call to flashLoan() (where t is the
token requested for the flashloan)?
(A): The FlashLoan contract's balance of token t will INCREASE OR STAY THE SAME
(B): The FlashLoan contract's balance of token t will DECREASE OR STAY THE SAME
(C): The FlashLoan contract's balance of token t will STAY THE SAME
(D): None of the above

[Q8] Which of the following are guaranteed to hold after a successful (i.e., non-reverting) execution 
of flashLoan(), assuming the token for which the flashloan is requested uses OpenZeppelin’s
Standard ERC20 implementation?
(A): The receiver’s balance of “token” increases
(B): The funds that the FlashLoan contract has approved the receiver to spend has either stayed the same or decreased
(C): The sum of all flashloans granted by the FlashLoan contract is less than the maxFlashLoan amount
(D): The token balance of any contract/user other than the FlashLoan contract, the caller of the flashLoan(), and the “receiver” contract will remain the same as before the call to flashLoan()