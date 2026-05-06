pragma solidity ^0.8.20;

contract Sidekick {

    function makeContact(address hero) public {

        // send random calldata that does NOT match any function selector
        bytes memory payload = hex"deadbeef";

        (bool success, ) = hero.call(payload);

        require(success, "Call failed");
    }
}