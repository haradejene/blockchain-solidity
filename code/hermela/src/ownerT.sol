pragma solidity ^0.8.20;

contract Contract {
    uint256 public a;
    uint256 public b;
    uint256 public c;
    address private _owner;
    
    constructor() {
        _owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner can call this function");
        _;
    }
    
    function setA(uint256 _a) external onlyOwner {
        a = _a;
    }
    
    function setB(uint256 _b) external onlyOwner {
        b = _b;
    }
    
    function setC(uint256 _c) external onlyOwner {
        c = _c;
    }
}