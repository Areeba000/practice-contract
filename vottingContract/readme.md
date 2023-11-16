# Voting Smart Contract

This Solidity smart contract allows for a simple voting system where users can register candidates and cast votes. The contract owner can start and finalize the election, and the contract keeps track of the winning candidate and the number of votes received by each candidate.

## Features

- Register candidates to participate in the election.
- Users can cast their votes for their preferred candidate.
- The contract owner can start and finalize the election.
- View the number of votes received by each candidate.
- Determine the winning candidate.

## Getting Started

To use this voting smart contract, follow these steps:

1. Deploy the smart contract on the Ethereum blockchain using a tool like Remix or Truffle.

2. The contract owner (the deployer) can start the election using the `setsatuts` function.

3. Register candidates using the `registercandidates` function.

4. Users can cast their votes for their preferred candidate using the `vote` function.

5. The contract owner can finalize the election.

6. View the number of votes received by each candidate and determine the winning candidate.

## Smart Contract Details

- `contractowner`: The Ethereum address of the contract owner who can start and finalize the election.

- `candidateslist`: An array of candidate addresses registered for the election.

- `voterecived`: A mapping that tracks the number of votes received by each candidate.

- `winer`: The address of the winning candidate.

- `winervote`: The number of votes received by the winning candidate.

- `satuts`: An enumeration to track the election's status (Not Started, Running, Completed).

## Functionality

- `setsatuts`: Allows the contract owner to set the election status as "Running" or "Completed."

- `registercandidates`: Permits the owner to register candidates for the election.

- `vote`: Allows users to cast their votes for their preferred candidates, subject to validation and an active election.

- `validatecandidates`: Validates if a given candidate is registered for the election.

- `votescount`: Returns the number of votes received by a specific candidate during a running election.

- `result`: Allows the owner to determine the winning candidate after the election is completed.

## Example Usage

1. The owner deploys the contract.

2. The owner starts the election using `setsatuts`.

3. The owner registers candidates using `registercandidates`.

4. Users cast votes for their preferred candidates using `vote`.

5. The owner finalizes the election using `setsatuts`.

6. The owner determines the winning candidate using `result`.

