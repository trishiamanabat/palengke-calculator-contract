// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackanaDefense {
    uint256 public criticalData;
    address public owner;

    // The constructor runs once when the contract is deployed
    constructor() {
        // msg.sender is the person who clicks 'Deploy'
        owner = msg.sender;
    }

    // Task 1: Use assert() to check internal consistency
    function updateCriticalData(uint256 _newData) public {
        criticalData = _newData;
        
        // Assert checks for things that should "Never be false"
        // Since uint256 is unsigned (cannot be negative), this will always be true.
        // If it were somehow false, the whole transaction would fail.
        assert(criticalData >= 0);
    }

    // Task 2: Use revert() for access control and error messages
    function restrictedUpdate(uint256 _newData) public {
        // If the person calling the function is NOT the owner...
        if (msg.sender != owner) {
            // ...stop everything and explain why!
            revert("Access denied: Only the owner can update critical data.");
        }
        
        criticalData = _newData;
    }
}