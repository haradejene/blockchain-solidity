pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    
    error NotOwner(address caller);
    error NoFunds();
    error TransferFailed();
    
    constructor() payable {
        owner = msg.sender;
    }
    
    function withdraw() external {
        if (msg.sender != owner) {
            revert NotOwner(msg.sender);
        }
        
        uint256 balance = address(this).balance;
        if (balance == 0) {
            revert NoFunds();
        }
        
        (bool success, ) = owner.call{value: balance}("");
        if (!success) {
            revert TransferFailed();
        }
    }
    
    receive() external payable {}
}