pragma solidity ^0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote[] public votes;

	function createVote(Choices choice) external {
		// Check if the caller has already voted
		require(!hasVoted(msg.sender), "Already voted");
		votes.push(Vote(choice, msg.sender));
	}
	
	function changeVote(Choices newChoice) external {
		// Check if the caller has already voted
		require(hasVoted(msg.sender), "No existing vote");
		
		// Find and update the vote
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == msg.sender) {
				votes[i].choice = newChoice;
				return; // Exit after finding and updating
			}
		}
	}
	
	function hasVoted(address voter) public view returns(bool) {
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == voter) {
				return true;
			}
		}
		return false;
	}
	
	function findChoice(address voter) external view returns(Choices) {
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == voter) {
				return votes[i].choice;
			}
		}
		return Choices.Yes; // Default return (won't be reached if vote exists)
	}
}