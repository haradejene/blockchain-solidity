pragma solidity ^0.8.20;

contract Contract {
     uint8 public x;
    
constructor (uint8 _x){
    x = _x;
}
function increment() external{
   x = x+1;
}
}