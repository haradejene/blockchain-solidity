// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");
        users[msg.sender] = User(100, true);
    }

    function transfer(address recipient, uint amount) external {
        // Ensure both addresses have active users
        require(users[msg.sender].isActive, "Sender does not have an active user");
        require(users[recipient].isActive, "Recipient does not have an active user");
        
        // Ensure sender has enough balance
        require(users[msg.sender].balance >= amount, "Insufficient balance");
        
        // Transfer the amount
        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}