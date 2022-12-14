// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Kyc {
  //The key of the mapping is candidate name stored as type bytes32 and value is
  //an unsigned integer to store the vote count
  mapping (bytes32 => uint256) public votesReceived;
  
  // We will use an array of bytes32 to store the list of candidates
  
  bytes32[] public candidateList;

  /*When we deploy the contract, we will pass an array of candidates who will be contesting in the election
  */
  constructor(bytes32[] memory candidateNames) {
    candidateList = candidateNames;
  }

  // This function returns the total votes a candidate has received so far
  function totalVotesFor(bytes32 candidate) view public returns (uint256) {
    require(validCandidate(candidate));
    return votesReceived[candidate];
  }

  // This function increments the vote count for the specified candidate. This
  // is equivalent to casting a vote
  function voteForCandidate(bytes32 candidate) public {
    require(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}