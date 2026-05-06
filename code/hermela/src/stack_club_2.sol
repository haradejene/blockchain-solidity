// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackClub {
    address[] public members;

    constructor() {
        // Add the deployer address as the first member
        members.push(msg.sender);
    }

    modifier onlyMember() {
        require(isMember(msg.sender), "Caller is not a member");
        _;
    }

    function addMember(address newMember) external onlyMember {
        members.push(newMember);
    }

    function removeLastMember() external onlyMember {
        require(members.length > 0, "No members to remove");
        members.pop();
    }

    function isMember(address addr) public view returns (bool) {
        for(uint i = 0; i < members.length; i++) {
            if(members[i] == addr) {
                return true;
            }
        }
        return false;
    }
}