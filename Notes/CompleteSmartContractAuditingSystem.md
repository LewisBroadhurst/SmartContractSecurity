# Notes from https://www.youtube.com/watch?v=5g-Hzw5ind8

## Intro
- Expect avg 100 lines of code per hour target
- Research similar protocol audits e.g. NFT => NFT, AMM => AMM, etc
- Who do I need to communicate with, is there someone I can work with?
- Tooling

## Beginning the Audit
1. Look at and understand the README
   
2. Scan for block comments that indicate context for the contract
   
3. Jobs to be done:
    - List out the functions users can do, e.g. provide liquidity, withdraw liquidity, create swaps
    - Find how these are performed within the code
    - Follow the functionality through the code, build the pathway
    - Tag the code with comments -- don't get bogged down in the code, just mention thoughts
    - Check the test suite, what is the coverage, what is missing, are there blind spots?
    - Generate a call graph -- use surya?

4. Tackling Jobs
   - Start pulling on the threads from the audit tags
   - Take time to tackle the low level problems
   - Understand what each line is doing
   - Always stick to the thread you are currently working on

5. List the different breakpoints an attacker could hit
   - May line up with some of the audit tags
   - Combine with 'Divergent Thinking'
   - How can we break the modifiiers, bypass checks, etc

6. Writing tests & POCs
   - Allows you to prove your idea and give the idea a much more solid idea of the contract
   - Compare your idea vs. the truth of how the contract works