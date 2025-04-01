// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Vote {
        string topic;
        uint256 votes;
    }

    mapping(address => bool) public voters;
    Vote[] public votes;

    // Add a new topic
    function addTopic(string memory _topic) public {
        votes.push(Vote({
            topic: _topic,
            votes: 0
        }));
    }

    // Vote for a topic
    function vote(uint256 _topicId) public {
        require(!voters[msg.sender], "You have already voted");
        voters[msg.sender] = true;
        votes[_topicId].votes++;
    }

    // Get the number of votes for a topic
    function getVotes(uint256 _topicId) public view returns (uint256) {
        return votes[_topicId].votes;
    }

    // Get all voting topics
    function getTopics() public view returns (string[] memory) {
        string[] memory topics = new string[](votes.length);
        for (uint i = 0; i < votes.length; i++) {
            topics[i] = votes[i].topic;
        }
        return topics;
    }
}
