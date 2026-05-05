pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;
    
    // Track votes: proposalId => voter => hasVoted and their choice
    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public votedYes;
    
    function newProposal(address target, bytes calldata data) external {
        Proposal memory newProposal = Proposal({
            target: target,
            data: data,
            yesCount: 0,
            noCount: 0
        });
        
        proposals.push(newProposal);
    }
    
    function castVote(uint proposalId, bool _supports) external {
        require(proposalId < proposals.length, "Proposal does not exist");
        
        if (hasVoted[proposalId][msg.sender]) {
           
            bool previousVote = votedYes[proposalId][msg.sender];
            
            
            if (previousVote != _supports) {
                
                if (_supports) {
                    
                    proposals[proposalId].noCount--;
                    proposals[proposalId].yesCount++;
                } else {
                    
                    proposals[proposalId].yesCount--;
                    proposals[proposalId].noCount++;
                }
                
                votedYes[proposalId][msg.sender] = _supports;
            }
            
        } else {
            
            if (_supports) {
                proposals[proposalId].yesCount++;
            } else {
                proposals[proposalId].noCount++;
            }

            hasVoted[proposalId][msg.sender] = true;
            votedYes[proposalId][msg.sender] = _supports;
        }
    }
    
    function getVote(uint proposalId, address voter) external view returns (bool hasVotedAlready, bool voteChoice) {
        hasVotedAlready = hasVoted[proposalId][voter];
        voteChoice = votedYes[proposalId][voter];
    }
}