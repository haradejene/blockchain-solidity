
pragma solidity ^0.8.20;


interface IHero {
    function alert() external;
}

contract Sidekick {

    
    function sendAlert(address hero) public {

        IHero(hero).alert();
    }
}