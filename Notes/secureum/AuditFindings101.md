## Unhandled return values from transfer/transferFrom
- Medium severity
- Safer to use SafeERC20 Wrappers

## Reentrancy
- Critical Severity
- Function allowed for malicious external calls
- Add reentrancy guard

## Major input problem w/ tokens >18 decimals
- Major severity
- Should use SafeMath for tokens >18 decimals

## Unchecked error codes
- Major Severity
- Never reverted on error, just gave error

## Incorrect parameter ordering
- Med Sev
- Call on function used incorrect argument order

## No address validation
- Critical severity
- Use msg.sender as address

## Major error handling problem
- Major Sev
- Incorrect check of the swap tokens

## DOS
- Med Sev
- Accepted deposits of 0
- 0 deposit can be a big problem

## Func overwrites storage values
- Critical
- Add to existing, not override

## Timing problems, purchase/commit
- critical

## Data Validation
-  Major severity
- Caused by unsafe casting, downcast
- Use SafeCast

## Timing - Allocation pre launch
- Med
- Sending 1 wei would reduce protocol function

## Error handling
- med
- Timer returned true instead of false
- Return false pre initialisation

## Data Validation
- Med
- Overflow/Underflow, should use safemath

## Timing - Oracle front running
- Critical sev
- Oracle front running

## DOS - Token Overflows

## Access Control - High Severity
- Changing admin/owner rights

## Bad error handling
- Unchecked return values

## rounding up/down issues

## Data Validation on inputs

## No contract existence check

## Front running initialiser functions
- Use factory pattern

## Use two step changes for critical functions

## Unbounded loops

## Batch transactions
- If 1 order fails, entire batch fails
- Use NoThrow variants

## Missed blacklisting/access control on critical functions

## Wrong ordering of parameters

## Side effects of function calls in functions

## unpause/pause or lock/unlock functions faulty

## Divide by 0
- add require(x > 0)
- Or SafeMath

## No withdraw function - ETH stuck in contract

## DOS - transfer() potentially fails



### Need to understand...
- Front Running
- Reentrancy
- Pausing
- TimeLocks
- Locks
- Proxy Implementation