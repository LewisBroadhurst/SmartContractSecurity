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

## TXs vs Messages

- TX: Offchain -> Onchain. Triggers MSG.
- Message: Onchain -> Onchain. Triggered by EOA, Contract, or within the EVM.

TXs
- Grouped together into blocks
- Blocks linked together -> blockchain

Block
- Group of TXs
- Contains a Hash of the previous block

ETH node/client
- P2P
- Client: specific implementation of ETH, GETH, OpenEthereum, Erigon, etc
- TXs cast to nodes and combined into blocks

Block Gas Limit
- Total Gas spent in a block
- Caps the number of TXs that can be included in a block
- Set by validators
- Price of gas dependant on demand

GHOST
- Greedy Heaviest Observed SubTree
- Protocol for choosing valid chain

ETH state
- Modified Merkle Patricia Tree -- type of binary tree

Block Header
- Header, TXs, 0mmers' hash
- gasLimit, gasUsed, extraData, timestamp


# Block 4

## Memory -- volatile
- Not persistent across blocks

Specific Operations:
- MLOAD: loads word from memory
- MSTORE: stores word to memory
- MSTORE8: stores byte to memory

## Storage -- persistent
- Key-Value store
- 0 initialized

Instructions:
- SLOAD: loads word from storage
- SSTORE: stores word to storage

## Calldata
- Used for data parameters
- Read-only
- Byte addressable

CALLDATSIZE
CALLDATALOAD
CALLDATACOPY