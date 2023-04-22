# The Process of Auditing

1. Read the whitepaper and documentation, get a feel of how the protocols work, what they are trying to do, and how they do it. Speak to the team about any questions you have.
<br>

2. Build up a foundry repo with testing and create cleaner code I can use as a playground by spliting up the codebase into smaller more manageable chunks.
<br>

3. Make the user story from the pathway of functions that are called - normally starts from an external call that then works it way through the system. Follow documentation along this pathway and understand how each function works and operates in the system. Create a new document per user story. An example may be, 'Buy an NFT' -- 'Open a long position' -- 'Add liquidity to the liquidity pool'. Lots of comments needed - also good to note potential vulnerabilites if obvious.
<br>

4. Focus on one single user story and identify potential faults and vulnerabilities. Note bad code and scenarios that could cause problems, write tests and POCs to test out the theories.
<br>

5. Any findings that are confirmed to be problematic for the system are then written up into a standardised format that is clear, concise, and, informative. This is then sent to the team for review and discussion. Great examples of reports include:
    - https://code4rena.com/reports
    - https://github.com/pashov/audits/tree/master/solo
