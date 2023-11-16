# Crowdfunding Smart Contract

This is a Solidity smart contract for decentralized crowdfunding on the Ethereum blockchain. It allows users to create crowdfunding campaigns, contribute funds, and manage the campaign's lifecycle.

## Features

- **Create a Campaign**: Users can create a crowdfunding campaign by specifying the funding goal in Ether and the campaign duration in minutes.

- **Contribute Funds**: Contributors can send Ether to the campaign using the `contribute` function, indicating the amount they wish to contribute.

- **Check Funding Goal**: The contract owner can check if the funding goal is reached using the `checkGoalReached` function.

- **Withdraw Funds**: If the funding goal is reached, the owner can withdraw the funds using the `withdrawFunds` function.

- **Refund Contributions**: If the funding goal is not met, contributors can request a refund of their contributions using the `refundContribution` function.

## Contract Deployment

- Ensure you have the necessary environment set up, including a development environment like Remix or Truffle and an Ethereum wallet to deploy the contract.

- Deploy the contract, providing the initial goal in Ether and campaign duration in minutes as constructor arguments.

## Usage

![Screenshot 2023-11-08 111833](https://github.com/Areeba000/contract-Practice/assets/140241495/e9842b04-a56c-4e08-a387-4c3fd81f24bf)

1. **Create a Campaign**: Deploy the contract with your desired funding goal and duration.

2. **Contribute Funds**: Contributors can call the `contribute` function and send Ether to the contract's address.

3. **Check Funding Goal**: The owner can call `checkGoalReached` to determine if the funding goal is reached.

4. **Withdraw Funds**: If the funding goal is reached, the owner can use the `withdrawFunds` function to collect the funds.

5. **Refund Contributions**: If the funding goal is not met, contributors can request refunds using the `refundContribution` function.

## Important Notes

- Ensure the contract owner is a trusted entity, as they can control the campaign and withdraw funds.

- Contributors can only request refunds if the funding goal is not met.


