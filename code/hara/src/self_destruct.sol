// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/console.sol";
contract Contract {
  address public owner;
  address public charity;
  constructor (address _charity){
      owner = msg.sender;
      charity = _charity;

  }
  receive() external payable {
    console.log(msg.value);
  }
  function tip() public payable {
    (bool s,) = owner.call {value: msg.value}("");
  }
      function donate() external {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "No funds to donate");
        
        (bool success, ) = charity.call{value: contractBalance}("");
        require(success, "Transfer failed");


        selfdestruct(payable(charity));
    }

}