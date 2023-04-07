## Safest method for transfer to avoid reentrancy attack
```
// transfer fee to the 3rd party protocol
(bool OK, ) = payable(_feeTo).call{value: _feeAmount}("");
require(OK, "ETH transfer failed");
_msgValue = msg.value - _feeAmount;
```