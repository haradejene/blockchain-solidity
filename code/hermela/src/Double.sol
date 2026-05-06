pragma solidity ^0.8.0;

contract Contract {
    function double(uint x) external pure returns (uint) {
        return x * 2;
    }
}