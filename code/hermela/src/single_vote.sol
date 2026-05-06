// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    mapping(address => bool) public hasVoted;

    function createVote(Choices choice) external {
        require(!hasVoted[msg.sender], "Address has already voted");
        
        votes.push(Vote(choice, msg.sender));
        hasVoted[msg.sender] = true;
    }

    function findChoice(address addr) external view returns (Choices) {
        require(hasVoted[addr], "Voter not found");
        
        for(uint i = 0; i < votes.length; i++) {
            if(votes[i].voter == addr) {
                return votes[i].choice;
            }
        }
        revert("Voter not found");
    }
}