// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title CustomerRegistry
 * @dev A system for Neri to register and manage full customer profiles.
 */
contract CustomerRegistry {

    // 1. Define the Struct: A custom data type that groups different variables
    struct Customer {
        string name;
        address walletAddress;
        uint256 balance;
    }

    // 2. Create the Mapping: Key is the address, Value is the whole Customer "folder"
    mapping(address => Customer) public customers;

    /**
     * @notice Registers the person calling the function as a customer.
     * @param _name The customer's name (e.g., "Neri")
     * @param _balance Their starting balance (e.g., 100)
     */
    function addCustomer(string memory _name, uint256 _balance) public {
        // We use msg.sender so the system automatically knows who is signing up
        customers[msg.sender] = Customer({
            name: _name,
            walletAddress: msg.sender,
            balance: _balance
        });
    }

    /**
     * @notice Retrieves the full profile of a customer via their address.
     * @param _walletAddress The address to look up.
     * @return name, walletAddress, balance
     */
    function getCustomer(
        address _walletAddress
    ) public view returns (string memory, address, uint256) {
        // Fetch the struct from storage into temporary memory
        Customer memory customer = customers[_walletAddress];
        
        // Return the individual pieces of the struct
        return (customer.name, customer.walletAddress, customer.balance);
    }
}