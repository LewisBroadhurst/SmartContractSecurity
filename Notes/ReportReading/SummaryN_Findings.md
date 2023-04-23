# Notes from reading Audit Reports

### [N-01] Import declarations should import specific symbols vs. whole file

```
import "@openzeppelin/contracts/utils/math/Math.sol" // bad

import {SafeAdd} from "@openzeppelin/contracts/utils/math/Math.sol" // good
```

### [N-02] Use named paramers for mapping type declarations

```
mapping(address => uint256) private frontendDueTicketSales; // bad

mapping(address _address => uint256 noOfTickets) private frontendDueTicketSales; // good
```

### [N-03] Refactor commonly used code across contracts
Avoid having lots of repetitive code -- DRY (Don't Repeat Yourself).

### [N-04] Unused local variables
Unused variables should be removed.

### [N-05] Use a modifier for access control
Consider using a modifier to implement access control instead of inlining the condition/requirement in the function’s body.

```
// bad
function onRandomNumberFulfilled(uint256 randomNumber) external override {
if (msg.sender != address(source)) {
    revert RandomNumberFulfillmentUnauthorized();
}

// good
modifier onlySource() {
    require(msg.sender == address(source), RandomNumberFulfillmentUnauthorized());
    _;
}

function onRandomNumberFulfilled(uint256 randomNumber) external override onlySource { ...
```

### [N-06] Contract files should define a locked compiler version
Contracts should be deployed with the same compiler version and flags that they have been tested with thoroughly. Locking the pragma helps to ensure that contracts do not accidentally get deployed using, for example, an outdated compiler version that might introduce bugs that affect the contract system negatively.

```
// bad
Foo.sol
pragma solidity ^0.8.0;

Bar.sol
pragma solidity ^0.8.10;

// good
Foo.sol
pragma solidity 0.8.10;

Bar.sol
pragma solidity 0.8.10;
```