// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title AntiHackanaLedger
 * @dev A decentralized ledger to store and retrieve user balances.
 */
contract AntiHackanaLedger {

    // 1. Declare the mapping to store balances
    // This links a wallet address to a number (uint256)
    mapping(address => uint256) public userBalances;

    /**
     * @dev Updates the balance for a specific user address.
     * @param _user The address of the user.
     * @param _newBalance The new amount to be stored.
     */
    function updateBalance(address _user, uint256 _newBalance) public {
        // This line takes the 'drawer' labeled with _user's address
        // and puts the _newBalance inside it.
        userBalances[_user] = _newBalance; 
    }

    /**
     * @dev Retrieves the balance of a specific user.
     * @param _user The address to look up.
     * @return The balance associated with that address.
     */
    function getBalance(address _user) public view returns (uint256) {
        // This 'view' function just reads the data without changing it.
        return userBalances[_user];
    }
}