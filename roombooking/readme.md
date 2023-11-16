# Solidity Room Booking Smart Contract

## Overview

This Solidity smart contract allows for room booking with access key control on the Ethereum blockchain. The contract provides the following features:

- Setting and updating the room's access key, restricted to the owner.
- Retrieving the room's access key upon payment.
- Verifying a provided access key for booking the room.

## Features

- **Owner**: The contract designates an owner as a payable address who can control the access key.

- **Statuses Enum**: An enumeration named `Statuses` is used to represent the room's status, which can be either "Vacant" or "Occupied."

- **Private Access Key**: The contract utilizes a private variable to store the room's access key.

- **Constructor**: A constructor initializes the contract with an initial access key, and the owner is set to the contract deployer.

- **setRoomAccessKey Function**: The contract provides a function for the owner to set and update the room's access key.

- **getRoomAccessKey Function**: To retrieve the room's access key, users are required to provide payment of at least 2 ether. The provided payment is sent to the owner.

- **roomBook Function**: This function allows users to check if a provided access key matches the room's access key, enabling room booking if it's a match.

## Usage

Here's how you can interact with the contract:

- **Setting and Updating the Access Key**:
  - The contract owner can call the `setRoomAccessKey` function to set or update the room's access key.

- **Getting the Access Key**:
  - Users can call the `getRoomAccessKey` function to retrieve the room's access key upon payment.

- **Booking a Room**:
  - The `roomBook` function is used to check if a provided access key matches the room's access key for booking.
 
![Screenshot 2023-10-24 120419](https://github.com/Areeba000/contract-Practice/assets/140241495/7fa4dd8a-4808-42ed-aada-06ab2b6875b2)




![Screenshot 2023-10-24 120556](https://github.com/Areeba000/contract-Practice/assets/140241495/37b8c8bf-8b45-4769-9c66-00a573a68421)



 - first owner deploy this contract with initialkey

   
 - then customer get  getRoomAccessKey put 2 eather rent pr room 


 - in transaction show key then put this in roomBook and access the room.

