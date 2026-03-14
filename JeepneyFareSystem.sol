// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title JeepneyFareSystem
 * @dev Implements an automated fare solution to prevent human error and disputes.
 */
contract JeepneyFareSystem {
    // Mapping to track if a passenger's address has paid [cite: 55]
    mapping(address => bool) public hasPaid;

    // The starting fare for the trip [cite: 56]
    uint256 public baseFare = 13;

    /** * @dev Calculates jeepney fares based on the distance traveled (13 + 2 per km)[cite: 47, 67, 68].
     * Being 'public view' allows passengers to check the price before paying[cite: 88].
     */
    function calculateFare(uint256 distance) public view returns (uint256) {
        return baseFare + (distance * 2);
    }

    /** * @dev Accepts passenger payments using the 'payable' modifier[cite: 48, 70].
     * It ensures the exact amount is paid and updates their status[cite: 72, 73, 90].
     */
    function payFare(uint256 distance) public payable {
        uint256 requiredFare = calculateFare(distance);
        // Validates that the amount sent matches the required fare [cite: 72]
        require(msg.value == requiredFare, "Incorrect fare amount.");
        hasPaid[msg.sender] = true;
    }

    /** * @dev A view function to check if a passenger has already paid[cite: 49, 75, 76].
     * This eliminates "Bayad na ako!" disputes by providing proof on the ledger[cite: 6, 92].
     */
    function checkPaymentStatus(address passenger) public view returns (bool) {
        return hasPaid[passenger];
    }

    /** * @dev Private function to verify the correctness of a fare calculation[cite: 50, 79, 80].
     * This logic is hidden from external access for internal security[cite: 93, 94].
     */
    function verifyFare(
        uint256 distance,
        uint256 paidAmount
    ) private view returns (bool) {
        return paidAmount == calculateFare(distance);
    }
}