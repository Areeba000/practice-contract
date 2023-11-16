# Ethereum Wallet Smart Contract (etherwallet)

 The contract allows an owner to store Ether and an associated message, and it provides functionality to withdraw the stored Ether. Below is a breakdown of the contract's key features and how to use it:

## Solidity Version

The contract is written in Solidity version 0.8.15.

## Contract Overview

The `etherwallet` contract consists of the following components:

- `owner`: A payable address variable representing the owner of the wallet.
- `message`: A public string variable that stores an associated message.
- `receive()`: A payable fallback function to receive Ether.
- `getbalance()`: A view function to check the contract's balance.
- `Constructor`: Initializes the contract with an initial message and sets the owner to the deploying account.
- `onlyowner` Modifier: Restricts access to certain functions to the owner only.
- `withdraw()`: Allows the owner to withdraw the entire balance from the contract.

## Interacting with the Contract

Here's how you can interact with this Ethereum wallet smart contract:

1. **Deploy the Contract**: Deploy the contract, providing an initial message in the constructor. This will set the owner and the initial message.

2. ![Screenshot 2023-10-27 104956](https://github.com/Areeba000/contract-Practice/assets/140241495/1e0366c3-1300-4179-866d-7d2c4775145c)


3. **Send Ether**: Send Ether to the contract's address. The `receive()` function allows the contract to receive Ether sent to it.

4. ![Screenshot 2023-10-27 105024](https://github.com/Areeba000/contract-Practice/assets/140241495/f1874101-5f56-4e0f-8954-20722d8c8f90)


5.  ![Screenshot 2023-10-27 105222](https://github.com/Areeba000/contract-Practice/assets/140241495/b8ffc6f3-a7b4-4848-b1c7-5dae3af5eb08)

   

6. ![Screenshot 2023-10-27 105110](https://github.com/Areeba000/contract-Practice/assets/140241495/61ddf603-0636-4fa5-9ac0-a79463672998)

  
7. **Check Balance**: Call the `getbalance()` function to check the current balance of the contract.

   
8. ![Screenshot 2023-10-27 105238](https://github.com/Areeba000/contract-Practice/assets/140241495/f0c118a5-0277-41bd-af2b-c78ce4e99d5e)


 9. **Withdraw Ether**: To withdraw the entire balance from the contract, call the `withdraw()` function. This function is protected by the `onlyowner` modifier, so only the owner can execute it.


 10. ![Screenshot 2023-10-27 105256](https://github.com/Areeba000/contract-Practice/assets/140241495/22fa2e4a-c64a-4510-ac72-29a55edfc292)


