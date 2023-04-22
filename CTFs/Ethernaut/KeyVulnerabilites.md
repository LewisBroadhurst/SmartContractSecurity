## Key Vulnerabilites
1. How can the owner of the contract be changed?
   - Need to be really careful with contract ownership.
   - How can the owner be changed maliciously? 
   - How can we reduce the number of owner changes to as close to zero as possible?
   - What would happen if we send ether to the contract via fallback or receive function?

2. Do the functions in the contract have the correct access modifiers?
   - How can we change the access modifiers of the functions?
   - If someone with no access rights can call a function, what can they do?
   - Need to check public/external functions and see what damage they could do if called by anyone.
 
3. Using a poor random number generation technique
   - How can we generate a random number safely, are they using Chainlink VRF?
   - Avoid using a FACTOR and blocknumber to generate a random number.

4. Be wary of using tx.origin => msg.sender

5. Underflow/Overflow of uints. Look for unsafe math.
   - Are they using SafeMath for calculations?
   - Are there any possible exploits with the math?

6. Delegation: how a Smart Contract can change the state of other smart contracts
   - delegatecall() can be used to change the state of other contracts -- similar to the call method
   - https://zuhaibmd.medium.com/ethernaut-level-6-delegation-ed5f56c39590
   - https://0xsage.medium.com/ethernaut-lvl-6-walkthrough-how-to-abuse-the-delicate-delegatecall-466b26c429e4

7. Storage of sensitive information should never be stored on the blockchain, a private access modifier will not hide this data. The only way to do this safely would be to hide it in a ZK Snark (or something like that). 
8. Be careful of the methods that you are importing from other contracts. If you inherit a contract you are also inheriting all of the methods from that contract, not just the ones you explicitally call.