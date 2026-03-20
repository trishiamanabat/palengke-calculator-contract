// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityFund {
    address public fundOwner;
    uint256 public totalDonations;

    constructor() {
        fundOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == fundOwner, "Only the owner can withdraw funds");
        _;
    }

    function donate(uint256 amount) public payable {
        require(amount > 0, "Donation must be greater than zero");
        require(msg.value == amount, "Insufficient Ether provided");
        totalDonations += amount;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= totalDonations, "Not enough funds");
        require(address(this).balance >= amount, "Insufficient contract balance"); // New check

        totalDonations -= amount;
        payable(fundOwner).transfer(amount);
    }
}