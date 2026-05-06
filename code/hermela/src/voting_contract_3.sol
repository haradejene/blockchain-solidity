// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;
    
    // Track votes: proposalId => voter => hasVoted (true/false)
    mapping(uint => mapping(address => bool)) public hasVoted;
    // Track vote choice: proposalId => voter => voteChoice (true=yes, false=no)
    mapping(uint => mapping(address => bool)) public voteChoice;

    function newProposal(address target, bytes memory _data) external {
        proposals.push(Proposal(target, _data, 0, 0));
    }

    function castVote(uint proposalId, bool support) external {
        require(proposalId < proposals.length, "Invalid proposal ID");
        
        if (!hasVoted[proposalId][msg.sender]) {
            // First time voting
            hasVoted[proposalId][msg.sender] = true;
            
            if (support) {
                proposals[proposalId].yesCount++;
            } else {
                proposals[proposalId].noCount++;
            }
            
            voteChoice[proposalId][msg.sender] = support;
        } else {
            // Changing vote
            bool previousChoice = voteChoice[proposalId][msg.sender];
            
            if (previousChoice == support) {
                // Same vote, do nothing
                return;
            }
            
            // Update counts based on previous vote
            if (previousChoice) {
                proposals[proposalId].yesCount--;
                proposals[proposalId].noCount++;
            } else {
                proposals[proposalId].noCount--;
                proposals[proposalId].yesCount++;
            }
            
            // Update vote choice
            voteChoice[proposalId][msg.sender] = support;
        }
    }
}