## Roadmap of a Liquidity Pool

### Creation of the Liquidity Pool

Token A / Token B pool does not exist.

Lisa adds 100 ETH and 10,000 AAVE.

This mints 1000 TOKENPOOL tokens, calculated by `sqrt(X * Y) = minted tokens` => `sqrt(100 * 10,000) = 1000 TOKENPOOL`

Lisa chose a ration of 1 ETH : 10 AAVE as that is the current market rate. If she chose another ratio arbitrage bots will
take advantage of the incorrect ratio.

### Jerry wants to add liquidity (Good Jerry)

Jerry decides to add liquidity to the Liquidity Pool, he adds 200 ETH and 20,000 AAVE.

He receives `sqrt(200 * 20,000) = 2000 TOKENPOOL`.

Jerry owns 66% & Lisa owns 33% of the TOKENPOOL tokens.

These percentages determine how many tokens they can redeem from the pool when they remove liquidity.

### Jerry2 wants to add liquidity (Bad Jerry)

Jerry decides to add liquidity to the Liquidity Pool, he adds 50 ETH and 20,000 AAVE.

Technically, he should receive `sqrt(50 * 20,000) = 1000 TOKENPOOL`, the same as Lisa.

Unfortunately, Jerry is not accurately representing the LPs market share, meaning he is either a bad actor or dumb.

Uniswap punishes users for adding liquidity pairs at incorrect ratios, and will receive less TOKENPOOL tokens as a result. 

This incentivises users to add tokens at the correct X / Y token ratio.

## Withdrawing from the LP

The math for withdrawing is really simple.

If Good Jerry wants to withdraw his tokens, he owns 66% of the pools TOKENSUPPLY, so he gets 66% of the ETH and AAVE reserves
at the time of withdrawal.

// https://medium.com/@chiqing/uniswap-v2-explained-beginner-friendly-b5d2cb64fe0f#:~:text=Uniswap%20V2%20allows%20traders%20to,is%20called%20%E2%80%9CLiquidity%20Pool%E2%80%9D.