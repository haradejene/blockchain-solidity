// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    function filterEven(uint[] memory numbers) external pure returns (uint[] memory) {
        // First, count how many even numbers there are
        uint evenCount = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                evenCount++;
            }
        }
        
        // Create a new memory array with the exact size needed
        uint[] memory evenNumbers = new uint[](evenCount);
        
        // Fill the array with even numbers
        uint index = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                evenNumbers[index] = numbers[i];
                index++;
            }
        }
        
        return evenNumbers;
    }
}