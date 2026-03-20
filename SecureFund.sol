// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureFund {
    address public owner;
    uint256 public totalDonations;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _; 
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than zero");
        totalDonations += msg.value;
    }

    // FIXED: This now updates totalDonations so it matches the actual balance
    function withdraw() public onlyOwner {
        uint256 amountToWithdraw = address(this).balance;
        
        // Reset the counter so it doesn't show 114 ETH after the money is gone
        totalDonations = 0; 
        
        payable(owner).transfer(amountToWithdraw);
    }
}