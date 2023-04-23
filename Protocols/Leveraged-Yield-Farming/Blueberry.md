# Blueberry

## The Solution

Blueberry is a decentralized, permissionless lending market at its core, which whitelists loan deployments that can sometimes be performed with greater than 100% LTV.

Loans are non-custodial, meaning that neither the protocol nor the borrower are able to take control of the funds. Rather, the 3 components: Collateral, Loan, and Deployment, are wrapped into a “Position NFT” held by the bank that can be redeemed for its PnL should the borrower decide to close their position.

## Overview

Blueberry is initially a `leveraged yield protocol` launching on Ethereum (ETH) with a main focus on `Uniswap V3 concentrated liquidity positions`.

Inside the protocol, there are three different types of participants that each plays an important role to make sure it all works: Lenders, Yield farmers, and Liquidators.

- `Lenders` can lend many assets, e.g. ETH / USDC. Lending interest comes from the leveraged yield farmers & liqudidity providers who borrow the lenders assets to farm/provide liquidity in a given market.
- `Yield Farmers / Liquidity Providers` can perform leveraged yield farming/liquidity provision on many different asset pairs and strategies of their preference.
    - Blueberry anables leverage positions by borrowing specific assests needed on behalf of the users that enter that specific strategy.
- `Liqudiators` can perform liquidations on active positions that are at a negative pnl. This will earn them a liquidation incentive and makes the position whole for the lender.

// Watch this video to learn more about Blueberry: https://www.youtube.com/watch?v=HBDbeUPKijg

// https://docs.blueberry.garden/blueberry-overview/what-is-blueberry