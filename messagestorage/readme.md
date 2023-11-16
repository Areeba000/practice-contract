# MessageStorage Smart Contract

The `MessageStorage` smart contract is a Solidity contract designed for storing a message that can be updated by the owner. Additionally, the contract introduces a condition to represent whether a place (or message) is available or rented. It also provides functionality to return the place to an available state and withdraw the contract's balance. Here's an overview of this contract:

## Solidity Version

The contract is written in Solidity version 0.8.0.

## Contract Overview

The `MessageStorage` contract includes the following components:

- `owner`: An address variable representing the owner of the contract. It is declared as `payable`, indicating that it can receive Ether.
- `message`: A public string variable that stores a message.
- `updateCount`: A public uint256 variable that keeps track of the number of message updates.
- `newmessage`: An enumeration (enum) named `msgplacecondition` that can have two values: `available` and `rented`. It represents the condition of the place (message).
- Constructor: Initializes the contract with an initial message, sets the owner, and initializes the message condition as `available`.
- `updateMessage()`: A function to update the message. It checks if the place is available, and if the sender sends 1 Ether, it updates the message. Otherwise, it returns the Ether to the sender and does not update the message. It also increments the update count and changes the place condition to `rented`.
- `getcondition()`: A view function to retrieve the current condition of the place (message).
- `returnplace()`: A function to return the place to the "available" condition.
- `withdraw()`: A function for the owner to withdraw the contract's balance. It requires that the sender is the owner.

## Interacting with the Contract

Here's how you can interact with the `MessageStorage` smart contract:

1. **Deploy the Contract**: Deploy the contract, providing an initial message in the constructor.

2. ![Screenshot 2023-10-27 120341](https://github.com/Areeba000/contract-Practice/assets/140241495/14c23a55-8eaf-4a90-ae0e-ea92419fa16f)


3. **Update the Message**: Call the `updateMessage()` function to update the message. The place condition must be "available," and you need to send 1 Ether to update the message.

4. ![Screenshot 2023-10-27 120524](https://github.com/Areeba000/contract-Practice/assets/140241495/180333bc-ccb6-4d07-851a-e818695ef292)



5. **Get the Condition**: Call the `getcondition()` function to check the current condition of the place (message).

6. **Return the Place**: Call the `returnplace()` function to return the place to the "available" condition.

7. ![Screenshot 2023-10-27 120541](https://github.com/Areeba000/contract-Practice/assets/140241495/3517e5fd-0954-4abb-ba3d-90b586432511)


8. **Withdraw Balance**: If you are the owner, you can call the `withdraw()` function to withdraw the contract's balance.

