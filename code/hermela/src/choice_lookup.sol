// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }

    function hasVoted(address addr) external view returns (bool) {
        for(uint i = 0; i < votes.length; i++) {
            if(votes[i].voter == addr) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address addr) external view returns (Choices) {
        for(uint i = 0; i < votes.length; i++) {
            if(votes[i].voter == addr) {
                return votes[i].choice;
            }
        }
        revert("Voter not found");
    }
}