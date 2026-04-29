pragma solidity ^0.8.13;

contract Contract {
    uint8 public a = 150;
    uint16 public b = 400;
    uint256 public sum;

    constructor() {
        sum = a + b;
    }
}