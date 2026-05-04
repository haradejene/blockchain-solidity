pragma solidity 0.8.20;

contract Contract {
    function sum(uint[5] memory numbers) external pure returns(uint total) {
        for(uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
    }
}