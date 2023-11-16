// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address public owner;
    uint256 public goal;
    uint256 public deadline;
    bool public fundingGoalReached;
    bool public campaignEnded;
    
    mapping(address => uint256) public contributions;
    uint256 public totalContributions;

    event FundTransfer(address contributor, uint256 amount, bool isContribution);
    event Refund(address contributor, uint256 amount);
    
    constructor(uint256 _goalInEther, uint256 _durationInMinutes) {
        owner = msg.sender;
        goal = _goalInEther * 1 ether;
        deadline =  _durationInMinutes ;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyContributor() {
        require(contributions[msg.sender] > 0, "Only contributors can call this function");
        _;
    }

    function contribute() public payable {
        require(!campaignEnded, "Campaign has ended");
        require(block.timestamp < deadline, "Campaign deadline reached");
        contributions[msg.sender] += msg.value;
        totalContributions += msg.value;
        emit FundTransfer(msg.sender, msg.value, true);
    }

    function checkGoalReached() public onlyOwner {
        require(!campaignEnded, "Campaign has already ended");
        require(block.timestamp >= deadline, "Campaign deadline not reached yet");
        
        if (totalContributions >= goal) {
            fundingGoalReached = true;
        }
        campaignEnded = true;
    }

    function withdrawFunds() public onlyOwner {
        require(campaignEnded, "Campaign must have ended");
        require(fundingGoalReached, "Funding goal not reached");
        payable(owner).transfer(totalContributions);
        emit FundTransfer(owner, totalContributions, false);
    }

    function refundContribution() public onlyContributor {
        require(campaignEnded, "Campaign must have ended");
        require(!fundingGoalReached, "Funding goal reached");
        uint256 amount = contributions[msg.sender];
        contributions[msg.sender] = 0;
        totalContributions -= amount;
        payable(msg.sender).transfer(amount);
        emit Refund(msg.sender, amount);
    }
}
