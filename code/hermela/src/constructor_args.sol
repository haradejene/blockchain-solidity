// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Hero.sol";

contract Mage is Hero(50) {
    // Inherits everything from Hero contract with health = 50
}

contract Warrior is Hero(200) {
    // Inherits everything from Hero contract with health = 200
}