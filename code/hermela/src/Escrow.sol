// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {

    // Depositor (payer)
    address public depositor;

    // Beneficiary (receiver)
    address public beneficiary;

    // Arbiter (approver)
    address public arbiter;
}