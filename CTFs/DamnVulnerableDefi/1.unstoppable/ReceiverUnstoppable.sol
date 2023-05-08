// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../node_modules/@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";
import "../../node_modules/solmate/src/auth/Owned.sol";
import { UnstoppableVault, ERC20 } from "./UnstoppableVault.sol";
import "../../";

/**
 * @title ReceiverUnstoppable
 * @author Damn Vulnerable DeFi (https://damnvulnerabledefi.xyz)
 */
contract ReceiverUnstoppable is Owned, IERC3156FlashBorrower {
    // Set in the constructor and is immutable
    UnstoppableVault private immutable pool;

    error UnexpectedFlashLoan();

    /*
    * @dev Constructor - invokes the UnstoppableVault contract
    * @param poolAddress The address of the UnstoppableVault pool
    */
    constructor(address poolAddress) Owned(msg.sender) {
        pool = UnstoppableVault(poolAddress);
    }

    /*
    * @dev invoked when Unstoppable Vault contract calls flashLoan
    */
    function onFlashLoan(
        address initiator,
        address token,
        uint256 amount,
        uint256 fee,
        bytes calldata
    ) external returns (bytes32) {
        // Could the fee be negative here?
        if (initiator != address(this) || msg.sender != address(pool) || token != address(pool.asset()) || fee != 0)
            revert UnexpectedFlashLoan();

        ERC20(token).approve(address(pool), amount);

        return keccak256("IERC3156FlashBorrower.onFlashLoan");
    }

    /*
    * @dev Calling this function invokes the UnstoppableVault.flashLoan function
    */
    function executeFlashLoan(uint256 amount) external onlyOwner {
        address asset = address(pool.asset());
        pool.flashLoan(
            this,
            asset,
            amount,
            bytes("")
        );
    }
}