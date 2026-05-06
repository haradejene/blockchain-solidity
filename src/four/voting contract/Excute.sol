pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed; // ✅ prevent double execution
    }

    Proposal[] public proposals;

    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;
    mapping(address => bool) public isMember;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    event ProposalExecuted(uint proposalId);

    constructor(address[] memory initialMembers) {
        isMember[msg.sender] = true;

        for (uint i = 0; i < initialMembers.length; i++) {
            isMember[initialMembers[i]] = true;
        }
    }

    function newProposal(address target, bytes calldata data) external {
        require(isMember[msg.sender], "Not a member");

        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0,
                executed: false
            })
        );

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external {
        require(isMember[msg.sender], "Not a member");

        Proposal storage proposal = proposals[proposalId];

        require(!proposal.executed, "Already executed");

        // handle vote change
        if (hasVoted[proposalId][msg.sender]) {
            bool previous = voteChoice[proposalId][msg.sender];

            if (previous) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        // apply new vote
        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;

        emit VoteCast(proposalId, msg.sender);

        // ✅ EXECUTION LOGIC
        if (!proposal.executed && proposal.yesCount >= 10) {
            proposal.executed = true;

            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");

            emit ProposalExecuted(proposalId);
        }
    }
}