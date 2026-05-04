pragma solidity ^0.8.0;

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function tip() public payable {
        (bool s, ) = owner.call{value: msg.value}("");
        require(s);
    }
}