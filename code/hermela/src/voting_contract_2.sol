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

    function newProposal(address target, bytes memory _data) external {
        proposals.push(Proposal(target, _data, 0, 0));
    }

    function castVote(uint proposalId, bool support) external {
        require(proposalId < proposals.length, "Invalid proposal ID");
        
        if (support) {
            proposals[proposalId].yesCount++;
        } else {
            proposals[proposalId].noCount++;
        }
    }
}