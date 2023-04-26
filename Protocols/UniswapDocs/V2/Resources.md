## Swaps
At the most basic level, all swaps in Uniswap V2 happen within a single function, aptly named swap:

`function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data);`

// https://docs.uniswap.org/contracts/v2/concepts/core-concepts/swaps

## Pools
Each Uniswap liquidity pool is a trading venue for a pair of ERC20 tokens.

Uniswap is unique in that it doesn’t use an order book to derive the price of an asset or to match buyers and sellers of tokens. Instead, Uniswap uses what are called Liquidity Pools.

### Pool Tokens
Whenever liquidity is deposited into a pool, unique tokens known as liquidity tokens are minted and sent to the provider's address.

// https://docs.uniswap.org/contracts/v2/concepts/core-concepts/pools

## Flash Swaps
Uniswap flash swaps allow you to withdraw up to the full reserves of any ERC20 token on Uniswap and execute arbitrary logic at no upfront cost, provided that by the end of the transaction you either:
- pay for the withdrawn ERC20 tokens with the corresponding pair tokens
- return the withdrawn ERC20 tokens along with a small fee

Flash swaps are incredibly useful because they obviate upfront capital requirements and unnecessary order-of-operations constraints for multi-step transactions involving Uniswap.

// https://docs.uniswap.org/contracts/v2/concepts/core-concepts/flash-swaps

## Oracles
A price oracle is any tool used to view price information about a given asset. When you look at stock prices on your phone, you are using your phone as a price oracle.

// https://docs.uniswap.org/contracts/v2/concepts/core-concepts/oracles

## Reading
### To Read

### Read
https://docs.uniswap.org/contracts/v2/concepts/protocol-overview/how-uniswap-works
https://docs.uniswap.org/contracts/v2/concepts/core-concepts/swaps
https://docs.uniswap.org/contracts/v2/concepts/core-concepts/pools