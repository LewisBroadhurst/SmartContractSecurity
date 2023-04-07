## Re-Entrancy Attack
### Applicable to any transfer of assets
- Caused by sending assets before completing all the require/revert checks
- Makes sense to only ever send assets after all the checks are done
- Can use the OpenZeppelin ReentrancyGuard or implemtent your own re-entrcy modifier

## On-chain randomness
### Often found with gambling contracts
- Can be tough to generate randomness on chain
- Never rely on block hashes or timestamps
- Use the Chainlink VRF, will generate a truly random number

## Overflow/Underflow
### Overflow is when you run out of bits to the left & v.v.
- Overflow: 255 + 1 = 0
- Underflow: 3 / 2 = 1
- Solution: use safe math libraries