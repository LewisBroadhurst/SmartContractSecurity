## Swaps
At the most basic level, all swaps in Uniswap V2 happen within a single function, aptly named swap:

`function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data);`

// https://docs.uniswap.org/contracts/v2/concepts/core-concepts/swaps

## Pools
Each Uniswap liquidity pool is a trading venue for a pair of ERC20 tokens.

Uniswap is unique in that it doesn’t use an order book to derive the price of an asset or to match buyers and sellers of tokens. Instead, Uniswap uses what are called Liquidity Pools.

### Pool Tokens
Whenever liquidity is deposited into a pool, unique tokens known as liquidity tokens are minted and sent to the provider's address.





## Reading
### To Read

### Read
https://docs.uniswap.org/contracts/v2/concepts/protocol-overview/how-uniswap-works