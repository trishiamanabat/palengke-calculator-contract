// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title PalengkeLedger
 * @dev Helps Neri manage multiple vendors and track total market sales accurately.
 */
contract PalengkeLedger {
    
    // --- State Variables ---
    string public vendorName;         
    uint256 public totalSales;        
    bool public transactionStatus;    

    // --- Mapping ---
    mapping(address => uint256) public vendorSales;

    /**
     * @notice Records a sale and updates all records.
     */
    function recordSale(
        address _vendor,
        string memory _vendorName,
        uint256 _saleAmount
    ) public {
        // Reset status to false at start (optional safety)
        transactionStatus = false;

        vendorName = _vendorName;
        totalSales += _saleAmount;
        vendorSales[_vendor] += _saleAmount;

        // Set to true only if logic reaches here
        transactionStatus = true;
    }

    /**
     * @dev Returns the status of the last transaction.
     */
    function isTransactionSuccessful() public view returns (bool) {
        return transactionStatus;
    }
}