pragma solidity ^0.8.20;

contract Sidekick {

    function sendAlert(
        address hero,
        uint256 enemies,
        bool armed
    ) public {

        // encode function signature + arguments
        bytes memory payload =
            abi.encodeWithSignature(
                "alert(uint256,bool)",
                enemies,
                armed
            );

        // low-level call to hero contract
        (bool success, ) = hero.call(payload);

        require(success, "Alert failed");
    }
}