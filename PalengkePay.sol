// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title PalengkePay
 * @dev A simple contract for Neri to record immutable payment data for local vendors.
 */
contract PalengkePay {
    // State Variables: These are stored permanently on the blockchain
    string public vendorName;
    string public payerName;      // Added per task
    uint256 public totalPayments;

    /**
     * @dev Updates the state variables with the provided payment details.
     * @param _vendorName The name of the vendor receiving the payment (e.g., "Mang Pedro")
     * @param _amount The payment amount (e.g., 500)
     * @param _payee The name of the person paying (e.g., "Juan Dela Cruz")
     */
    function recordPayment(
        string memory _vendorName,
        uint256 _amount,
        string memory _payee
    ) public {
        vendorName = _vendorName;
        totalPayments = _amount;
        payerName = _payee;      // Assigned _payee to our state variable
    }
}