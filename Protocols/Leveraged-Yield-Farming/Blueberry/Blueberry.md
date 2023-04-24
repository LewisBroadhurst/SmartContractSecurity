# Blueberry

## The Solution

Blueberry is a decentralized, permissionless lending market at its core, which whitelists loan deployments that can sometimes be performed with greater than 100% LTV.

Loans are non-custodial, meaning that neither the protocol nor the borrower are able to take control of the funds. 
Rather, the 3 components: Collateral, Loan, and Deployment, are wrapped into a “Position NFT” held by the bank that can be 
redeemed for its PnL should the borrower decide to close their position.

The Blueberry DAO acts as a decentralized risk department of a bank, determining appropriate risk parameters such as LTV 
and Min/Max Positions based on the deployment of the loan. DAO contributors including contract development shops and top 
security firms work through governance to ensure loans are safe and liquidations can be performed profitably when necessary. 
By isolating risks based on the deployment, the protocol increases safety for both lenders and borrowers. 
It also allows the protocol to support mid-cap assets.

The DAO will begin by offering integrations with popular loan deployments which are accessible on chain today, including the following categories:
1. Liquidity Provision / Yield Arbitrage: Automated LP yield strategies that earn trading fees, LSDs, and more
2. Leverage Trading: Access leverage into directional trades while maintaining full custody and earning yield rather than paying it
3. Real World Assets: KYC’d, Qualified Investors can access leverage into the low cost of capital on chain in order to deploy to RWAs such as treasury bills

## Overview

Blueberry is initially a `leveraged yield protocol` launching on Ethereum (ETH) with a main focus on `Uniswap V3 concentrated liquidity positions`.

Inside the protocol, there are three different types of participants that each plays an important role to make sure it all works: Lenders, Yield farmers, and Liquidators.

- `Lenders` can lend many assets, e.g. ETH / USDC. Lending interest comes from the leveraged yield farmers & liqudidity providers who borrow the lenders assets to farm/provide liquidity in a given market.
- `Yield Farmers / Liquidity Providers` can perform leveraged yield farming/liquidity provision on many different asset pairs and strategies of their preference.
    - Blueberry anables leverage positions by borrowing specific assests needed on behalf of the users that enter that specific strategy.
- `Liqudiators` can perform liquidations on active positions that are at a negative pnl. This will earn them a liquidation incentive and makes the position whole for the lender.

## What is unique about blueberry?

1. Flexible/isolated collateral: Allows a user to take a liquidity position using borrowed funds while maintaining directional exposure in their preferred asset as collateral
2. Lever up on chain
3. Blueberry Vaults: Uniswap v3 concentrated liquidity pools that optimise user yield.
4. Boosted yield via $bBLB rewards: Governance token rewards are distributed to boost yields.
5. Hedging Capabilities: Borrow additional tokens and sell to hedge farming exposure.

// Watch this video to learn more about Blueberry: https://www.youtube.com/watch?v=HBDbeUPKijg
// https://docs.blueberry.garden/blueberry-overview/what-is-blueberry
