// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {

    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {

        // 🔒 security check: only arbiter can call this
        require(msg.sender == arbiter, "Only arbiter can approve");

        uint256 balance = address(this).balance;

        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer failed");
    }
}