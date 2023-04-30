## ERC20 transfers
- transfer/transferFrom
- should return true/false
- no boolean, calls fail
- check boolean return

## ERC20 Optional
- for name symbol decimals
- Need to be used and present
- check their presence
- ERC20 decimals is especially important
- Should use uint8

## ERC20 approve

## ERC777 hooks
- be careful to not make external calls

## Token Deflation/Inflation
- burn tokens on transfers
- tokens received may not be same as sent
- should check unexpected behaviour
- look out for tokens that are not burned

## High token complexity
- well defined spec
- simple token is better
- Complexity = bugs

## ERC20 token minting
- Dangerous to leave minting vulnerable

## Token Pause
- Guarded launch

## ERC1400 addresses
- permissioned addresses
- 