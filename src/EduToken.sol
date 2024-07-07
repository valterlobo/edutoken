// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title EduToken
 * @dev Implementation of the EduToken which is an ERC20 token with additional features:
 * - Burnable: Tokens can be burned.
 * - Pausable: Token transfers can be paused.
 * - Capped: There is a cap on the total supply of tokens.
 * - Permit: Allows for approvals via signatures, following the ERC20Permit standard.
 * - Ownable: Ownership control mechanism.
 */
contract EduToken is ERC20, ERC20Burnable, ERC20Pausable, ERC20Capped, ERC20Permit, Ownable {
    /**
     * @dev Sets the values for {name}, {symbol}, {maxSupply}, and transfers ownership to {initialOwner}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory nm, string memory sbl, uint256 maxSupply, address initialOwner)
        ERC20(nm, sbl)
        Ownable(initialOwner)
        ERC20Permit(nm)
        ERC20Capped(maxSupply)
    {}

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     * - Can only be called by the current owner.
     */
    function pause() public onlyOwner {
        _pause();
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     * - Can only be called by the current owner.
     */
    function unpause() public onlyOwner {
        _unpause();
    }

    /**
     * @dev Creates `amount` new tokens for `to`.
     *
     * See {ERC20-_mint}.
     *
     * Requirements:
     *
     * - the caller must be the owner.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    /**
     * @dev Updates the token transfer process.
     *
     * This override is required by Solidity to ensure compatibility between
     * ERC20, ERC20Pausable, and ERC20Capped.
     */
    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Pausable, ERC20Capped) {
        super._update(from, to, value);
    }
}
