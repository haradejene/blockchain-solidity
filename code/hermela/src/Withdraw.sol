pragma solidity ^0.8.0;

contract Contract {
    address public owner;
    address public charity;

    constructor() payable {
        require(msg.value >= 1 ether);
        owner = msg.sender;
        charity = msg.sender;
    }

    receive() external payable {}

    function withdraw() public {
        require(msg.sender == owner);
        selfdestruct(payable(charity));
    }
}