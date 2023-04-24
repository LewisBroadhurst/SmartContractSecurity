# Leveraged Yield Farming

Simply yield farming with added leverage, if farming with X yields Y returns, yield farming yields 5X => 5Y.

You are borrowing funds to ramp up position X to multiply your Y yield.
This borrowing incurs a cost, you must pay interest for the privilege to use borrowed funds.

Leveraged yield farming allows for undercollateralised loans, improving capital efficiency and generating a higher APY for users.

### Two Key Participants

1. Lenders than deposit their single tokens within lending pools to earn yields.
    - Can get high APY (+10%) for single assets, sustained by high utilisation of the lending pool.
    - Deposit singletons of assets, e.g. ETH. BTC. USDC.

2. Farmers that borrow tokens from these lending pools to yield farm with leverage.
    - Can borrow tokens to increase their farming positions and capture additional farming yields.
    - Deposit pairs of assets, e.g. ETH/USDC. BTC/ETH.
    - Post deposit, the pair can then be leveraged up to 5x leverage.

### Utilisation

If a lending pool has 1000ETH and borrowers want to borrow 100ETH, the utilisation of that pool will be 10%.
Undercollateralised loans and leveraged yield farming have an edge -- each respective borrower can borrow much more.

With undercollateralised loans, the same borrower could borrow e.g. 500ETH, creating a utilisation of 50%. 
This is important as the interest rates gained by lenders slope upwards towards high utilisation.
Simply put: APR @ 50% utilisation >>> APR @ 10% utilisation.

### Safety

Although the loans are undercollateralised, the modern YFP model has proved safe as borrowers cannot withdraw the borrowed funds from the protocols.
The usage and return of the funds are tightly controlled by the protocols and their liquidation mechanisms, ensuring lenders receive their funds back.

This is in contrast to traditional lending platforms that allow borrowers to take and use their funds anywhere.


