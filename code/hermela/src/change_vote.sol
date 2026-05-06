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
    mapping(address => uint) public voteIndex; // Track index of each voter's vote

    function createVote(Choices choice) external {
        require(!hasVoted[msg.sender], "Address has already voted");
        
        votes.push(Vote(choice, msg.sender));
        voteIndex[msg.sender] = votes.length - 1;
        hasVoted[msg.sender] = true;
    }

    function changeVote(Choices choice) external {
        require(hasVoted[msg.sender], "No existing vote to change");
        
        uint index = voteIndex[msg.sender];
        votes[index].choice = choice;
    }

    function findChoice(address addr) external view returns (Choices) {
        require(hasVoted[addr], "Voter not found");
        
        uint index = voteIndex[addr];
        return votes[index].choice;
    }
}