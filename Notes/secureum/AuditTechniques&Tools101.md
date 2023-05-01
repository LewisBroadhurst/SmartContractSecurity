## Audit Process
1. Read spec/docs
2. Run fast tools, slither etc
3. Manual analysis
4. Slow/Deep tools
5. Iterate over and bounce ideas off of team
6. Write report

## Read Spec/Docs
- Read the spec/docs
- What do they expect the code to do?
- What are the requirements?
- Specification = why?
- Documentation = how?

Need to work out:
1. Assets
2. Actors
3. Actions

## Access Control
- Fundamental security primitive
- Who has access to what?
- Is access correct, complete, and consistent?

## Asset Flow
- Flow of assets in and out of the contract
- Who / When / Which
- Why / Where, why are we withdrawing, where are they going

## Control Flow
- Execution order of the code
- What function goes through and calls on other contracts/fucntions

## Data Flow

## Inferring Constants

## Dependencies
- OpenZeppelin / Consensys / Solmate

## Assumptions
- Incorrect assumptions are a common source of bugs
- Verify those assumptions
- 