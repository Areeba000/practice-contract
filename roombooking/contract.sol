// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract RoomBooking {
    // Define the owner of the contract as a payable address
    address payable public owner;

    // Enum to represent the status of the room (Vacant or Occupied)
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses currentStatus;

    // Private variable to store the room's access key
    string private roomAccessKey;

    // Constructor to initialize the contract with an initial access key
    constructor(string memory _initialAccessKey) {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
        roomAccessKey = _initialAccessKey;
    }

    // Function to set the room's access key, only accessible by the owner
    function setRoomAccessKey(string memory _newAccessKey) public {
        require(msg.sender == owner, "Only the owner can set the access key");
        roomAccessKey = _newAccessKey;
    }

    // Function to get the room's access key, requires a payment of at least 2 ether
    function getRoomAccessKey() public payable returns (string memory) {
        require(msg.value >= 2 ether, "Insufficient payment for access key");
        owner.transfer(msg.value);
        return roomAccessKey;
    }

    // Function to check if a provided access key matches the room's access key
    function roomBook(string memory _customerAccessKey) public view {
        require(
            keccak256(abi.encodePacked(_customerAccessKey)) == keccak256(abi.encodePacked(roomAccessKey)),
            "Invalid access key"
        );
    }
}
s