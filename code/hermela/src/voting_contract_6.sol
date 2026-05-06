// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }

    Proposal[] public proposals;
    
    // Track votes: proposalId => voter => hasVoted (true/false)
    mapping(uint => mapping(address => bool)) public hasVoted;
    // Track vote choice: proposalId => voter => voteChoice (true=yes, false=no)
    mapping(uint => mapping(address => bool)) public voteChoice;
    
    // Track members
    mapping(address => bool) public isMember;

    // Events
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    event ProposalExecuted(uint proposalId);

    constructor(address[] memory initialMembers) {
        // Add the deployer as a member
        isMember[msg.sender] = true;
        
        // Add all initial members
        for (uint i = 0; i < initialMembers.length; i++) {
            isMember[initialMembers[i]] = true;
        }
    }

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a voting member");
        _;
    }

    function newProposal(address target, bytes memory _data) external onlyMember {
        proposals.push(Proposal(target, _data, 0, 0, false));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external onlyMember {
        require(proposalId < proposals.length, "Invalid proposal ID");
        require(!proposals[proposalId].executed, "Proposal already executed");
        
        if (!hasVoted[proposalId][msg.sender]) {
            // First time voting
            hasVoted[proposalId][msg.sender] = true;
            
            if (support) {
                proposals[proposalId].yesCount++;
            } else {
                proposals[proposalId].noCount++;
            }
            
            voteChoice[proposalId][msg.sender] = support;
            emit VoteCast(proposalId, msg.sender);
        } else {
            // Changing vote
            bool previousChoice = voteChoice[proposalId][msg.sender];
            
            // Update counts based on previous vote
            if (previousChoice) {
                proposals[proposalId].yesCount--;
                if (support) {
                    proposals[proposalId].yesCount++;
                } else {
                    proposals[proposalId].noCount++;
                }
            } else {
                proposals[proposalId].noCount--;
                if (support) {
                    proposals[proposalId].yesCount++;
                } else {
                    proposals[proposalId].noCount++;
                }
            }
            
            // Update vote choice
            voteChoice[proposalId][msg.sender] = support;
            emit VoteCast(proposalId, msg.sender);
        }
        
        // Execute proposal if yesCount reaches 10
        if (proposals[proposalId].yesCount >= 10 && !proposals[proposalId].executed) {
            proposals[proposalId].executed = true;
            
            (bool success, ) = proposals[proposalId].target.call(proposals[proposalId].data);
            require(success, "Execution failed");
            
            emit ProposalExecuted(proposalId);
        }
    }
}