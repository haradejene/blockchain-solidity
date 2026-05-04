pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    
    event Approved(uint balance);
    
    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }
    
    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve");
        uint256 balance = address(this).balance;
        emit Approved(balance);
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer failed");
    }
}