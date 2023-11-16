# Lottery Smart Contract

This Solidity smart contract represents a simple lottery where users can participate by depositing Ether, and a winner is randomly chosen to receive the prize. The contract owner can start the lottery and select a winner.

## Features

- Users can deposit a minimum of 1 Ether to participate in the lottery.
- The contract owner can start the lottery and pick a random winner.
- The winner receives the entire balance of the contract.
- Prevents invalid deposits and lottery start if no players are participating.
- Provides transparency through a random number generation mechanism.

## Getting Started

Follow these steps to interact with the lottery smart contract:

1. Deploy the smart contract on the Ethereum blockchain using a tool like Remix or Truffle.

2. The contract owner (the deployer) can start the lottery.

3. Users can participate by depositing a minimum of 1 Ether into the contract.

4. Once enough players have participated, the owner can pick a winner.

5. The winner receives the entire contract balance.

## Smart Contract Details

- `owner`: The Ethereum address of the contract owner.
- `players`: An array of payable addresses representing participants in the lottery.

## Functionality

- `deposit`: Allows users to deposit Ether to participate in the lottery. Requires a minimum deposit of 1 Ether.

- `random`: Generates a pseudo-random number based on various factors, ensuring fairness in picking the winner.

- `pickWinner`: Allows the contract owner to start the lottery and choose a random winner. The winner receives the entire contract balance, and the list of participants is reset for the next round.

## Example Usage

1. Owner deploys the contract.

2. Users deposit Ether to participate.

3. Owner calls `pickWinner` to select a random winner.

4. Winner receives the prize.

