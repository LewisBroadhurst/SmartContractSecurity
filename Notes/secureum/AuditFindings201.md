# Audit Findings 201

## Lack of NatSpec comments on functions

## Hardcoded gas assumptions
- Gas prices have changed in the past
- Avoid hardcoding gas usage, if gas usage changes in the future, contract would be vulnerable

## Unbounded Loop - Gas Exhaustion
- May get a DOS

## Poor testing coverage

## System side effects from complicated code