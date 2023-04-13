- [ ] How do modifiers work?
## Modifiers
Can be used to restrict access, validate inputs, guard against reentrancy, etc.

Example:

```
// Modifier to check that the caller is the owner of
// the contract.
modifier onlyOwner() {
    require(msg.sender == owner, "Not owner");
    // Underscore is a special character only used inside
    // a function modifier and it tells Solidity to
    // execute the rest of the code.
    _;
}
```

Four broad categories of modifiers:

### Gate Checks

A "gate check" is a modifier that checks if a certain condition is true before allowing a function to execute. 
For example, you might have a function that allows a user to withdraw money from their account, but before the function executes, a developer might want to check if the user has enough money in their account to make the withdrawal. That check is considered a gate check modifier. 

### Preqequisites

A "prerequisite" is a modifier that sets up the environment for a function to execute, rather than checking if a certain condition is true. 

For example, a Solidity developer might use a function that requires a certain amount of Ether to be sent along with it in order to execute. In that case, the prerequisite would be the function that sets up the Ether balance. 

### Filters

A "filter" is a modifier that checks if a certain condition is true, and, if it is, allows the function to execute. If the condition is not true, then the function will not execute. 

### Reentrancy Attack Prevention

A reentrancy attack is a type of attack where a malicious actor tries to execute a function multiple times, via a recursive call, in order to exploit it.

For example, imagine that you have a function that allows a user to withdraw money from their account. A reentrancy attacker might try to call that function multiple times to withdraw more money than they actually have in their account. 


- [ ] How can I test gas usage optimisations?
- [ ] What are clear security issues and how can I find them?