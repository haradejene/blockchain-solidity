pragma solidity ^0.8.20;

contract Contract {
    function filterEven(uint[] calldata numbers) external pure returns(uint[] memory) {

        uint evenCount = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                evenCount++;
            }
        }
        
        
        uint[] memory evens = new uint[](evenCount);
        
       
        uint index = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                evens[index] = numbers[i];
                index++;
            }
        }
        
        return evens;
    }
}