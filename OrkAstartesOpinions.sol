// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Ork Astartes Chapter Opinions Log
/// @notice Records how Orks feel about fighting different Space Marine Chapters.
/// @dev Simple, safe, text-only contract.

contract OrkAstartesOpinions {

    // Explicit example address (valid, 40 hex digits, not a real wallet)
    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Opinion {
        string chapter;       // Space Marine Chapter
        string reaction;      // How the Orks feel about fightin' them
        string reason;        // Why the Orks think that
        string outcome;       // What happened in the scrap
        string remark;        // Extra Orky comment
        address creator;      // Who recorded it
        uint256 approved;     // WAAAGH-approved votes
        uint256 rejected;     // Not proppa' votes
        uint256 createdAt;    // Timestamp
    }

    Opinion[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event OpinionRecorded(uint256 indexed id, string chapter, address indexed creator);
    event OpinionVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Opinion({
                chapter: "Example Chapter (Fill your own below)",
                reaction: "Describe Ork reaction",
                reason: "Describe why",
                outcome: "Describe the scrap",
                remark: "Short Orky comment",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordOpinion(
        string calldata chapter,
        string calldata reaction,
        string calldata reason,
        string calldata outcome,
        string calldata remark
    ) external {
        require(bytes(chapter).length > 0, "Chapter required");

        logs.push(
            Opinion({
                chapter: chapter,
                reaction: reaction,
                reason: reason,
                outcome: outcome,
                remark: remark,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit OpinionRecorded(logs.length - 1, chapter, msg.sender);
    }

    function voteOpinion(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Opinion storage o = logs[id];

        if (approved) {
            o.approved += 1;
        } else {
            o.rejected += 1;
        }

        emit OpinionVoted(id, approved, o.approved, o.rejected);
    }

    function totalOpinions() external view returns (uint256) {
        return logs.length;
    }
}
