pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;
    
    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public votedYes;
    
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    
    function newProposal(address target, bytes calldata data) external {
        proposals.push(Proposal(target, data, 0, 0));
        emit ProposalCreated(proposals.length - 1);
    }
    
    function castVote(uint proposalId, bool _supports) external {
        require(proposalId < proposals.length, "Proposal does not exist");
        
        if (hasVoted[proposalId][msg.sender]) {
          
            bool previousVote = votedYes[proposalId][msg.sender];
            
            if (previousVote != _supports) {
                // Vote is changing - update counts
                if (_supports) {
                    proposals[proposalId].yesCount++;
                    proposals[proposalId].noCount--;
                } else {
                    proposals[proposalId].yesCount--;
                    proposals[proposalId].noCount++;
                }
                votedYes[proposalId][msg.sender] = _supports;
            }
            
            emit VoteCast(proposalId, msg.sender);
        } else {
            
            if (_supports) {
                proposals[proposalId].yesCount++;
            } else {
                proposals[proposalId].noCount++;
            }
            hasVoted[proposalId][msg.sender] = true;
            votedYes[proposalId][msg.sender] = _supports;
            emit VoteCast(proposalId, msg.sender);
        }
    }
}