# Block 2
## State
- Made up of objects -- accounts
- Each account has 4 fields:
  - Nonce
  - Balance
  - Contract Code
  - Contract Storage

## Account Types

EOA
- simple wallet public/private key
- Has a digital signature
- Can be used to send value or trigger smart contracts
- 

Contract
- Controlled by code in account
- When it receives TXs/Messages it may execute code/create new contracts/etc
- Autonomous agents -- simply waiting to be executed

## Transactions
- Signer messages
- Triggered by EOA externally from the blockchain
- Trigger state changes on the blockchain

Properties
- Atomic: Either all state changes happen or none
- Serial: Executed in order sequentially
- Inclusion & Order

Components
- Serialised Binary Message
  - Nonce: Sequence Number. Prevents message/transaction replays
  - gasPrice & gasLimit
  - recipient: destination address
  - value: amount of ETH in WEI
  - data: payload
  - ECDSA Signature: v - r - s
    - r - s: signature
    - v: recovery ID

# Block 3
