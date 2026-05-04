pragma solidity ^0.8.20;
import "forge-std/console.sol";
contract Contract {
    address public a;
    constructor() payable {
        a = msg.sender;
    
      if (msg.value < 1 ether){
          revert ("you should at least send 1 ether");
      }
    
      }
      
    
    
}