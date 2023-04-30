## Use same Pramga for tests and deployments

## Access Controls
- Think public/external/internal
- Who should be able to call this function?
- Ensure correct access control is enforced

## Self Destruct
- Must be strongly protected

## Modifiers side effects
- Must not make changes to state
- Should be called at the start of the contract

## Incorrect Modifiers
- Checks: execute _ or revert

## Constructor names

## Void constructors
- Calling unimplemented constructors
- Check implementation of contract

## Constructor callValue
- Not payable, will revert if sent value

## delegateCall
- Must be used with extreme care

## Reentrancy
- External contract calls can lead to contract callbacks
- Can lead to multiple withdrawals
- CEI pattern -- Checks, Effects, Interactions

## ERC777, extension to ERC20
- Supports hooks
- CEI pattern

## transfer() & send()
- Can be a problem with the 2300 gas limit
- Latest suggestion is to use call()

## private date
- Can be read, do not put sensitive data in private variables

## Pseudo random number generators

## Block timestamp/number
- Can be manipulated by miners
- Oracles provide an alternative

# B2

## TOD - Transaction Order Dependence
- Front / Back running
- Don't make assumptions about the transaction order

## ERC20 approve
- approve(100), may change that to approve(50)
- malicious contract can frontrun and spend 150 before the approve(50) takes effect
- increase/decreaseApproval() can be used to mitigate this

## ecRecover
- ecdsa lib is best practise

## transfer()
- Should return boolean
- Use SafeERC wrapper from OpenZeppelin

## ownerOf()

## Contract Balance

## fallback vs receive
- Check implications and assumptions

## strict equalities
- i.e. == or !=
- Use => or <=

## Locked Ether
- Can deposit but not withdraw

## Contract vs. EOA?
- check via msg.sender == tx.origin
- extcodesize > 0

## delete mapping
- consider locking instead

## State Modification
- Cannot be done in view or pure
- Will revert

## Account Existence

## Costly operations inside loops
- state variable updates especially bad
- use local variables to prevent DOS / outofgas errors
- External calls within loops can be dangerous
    - Especially is loop is user controlled
    - or bound to a sensible limit

## Missing event calls for critical operations
- important for off-chain applications
- important for UX / transparency

## Event Parameters
- Should be indexed into topics
- Not indexed, goes to data, much slower
- Add indexed to critical parameters

## Changing values of critical addresses
- Avoided at all costs
- Must be especially careful with these

## Visibility

## Inheritance
- Careful about inheritance order
- Go from more general -> more specific
- Missing inheritance can be a problem

## Gas Griefing
- Transaction Relayers

## Reference Parameters
- Structs/Arrays/Mappings
- Memory vs. Storage

## incorrect shifts (assembly)

## assembly use
- bypasses compiler checks

## RTLO
- Right to left override
- avoid RTLO

## constants
- declared constant saves gas, no longer need SLOAD
- side effect: cannot be changed

## variable names
- as distinct and unique as possible
- can lead to replaced usages

## Number literals
- 1 ether vs 1e18 etc
- Avoid 1000000000000000;

## Public functions
