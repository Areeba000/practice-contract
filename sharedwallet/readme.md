# SharedWallet Smart Contract

The `SharedWallet` is a Solidity smart contract that allows an owner to manage a shared wallet. It enables the owner to deposit, withdraw, transfer funds, add or remove other users as owners of the shared wallet. Additionally, shared wallet owners can withdraw funds or transfer funds to other addresses.

## Features

- Deposit funds into the shared wallet.
- Withdraw funds from the shared wallet (for owners).
- Transfer funds from the shared wallet to other addresses (for owners).
- Add or remove owners who have access to the shared wallet.

## Usage

![Screenshot 2023-11-07 155600](https://github.com/Areeba000/contract-Practice/assets/140241495/a3d76375-635a-4901-82b1-11e726ac919d)
  
### Contract Deployment

1. Deploy the contract to the Ethereum blockchain.

### Ownership

1. During deployment, the deployer's Ethereum address will be set as the contract owner.
2. The contract owner can add or remove other addresses as owners of the shared wallet using the `setowner` and `removeOwner` functions.

### Deposit Funds

1. Send Ether to the contract address to deposit funds into the shared wallet. This can be done by sending Ether directly to the contract address.

### Withdraw Funds

1. Owners of the shared wallet can use the `withdraw` function to withdraw a specific amount of Ether.
2. Specify the amount to be withdrawn as an argument when calling the function.

### Transfer Funds

1. Owners of the shared wallet can use the `transferTo` function to transfer a specific amount of Ether to another address.
2. Specify the recipient address and the amount to be transferred as arguments when calling the function.

## Modifiers

- `isOwner`: Ensures that a function is only accessible by the contract owner.
- `validOwner`: Ensures that a function is accessible by the contract owner or other addresses added as owners.

## Events

- `DepositFunds`: Logged when funds are deposited into the shared wallet.
- `WithdrawFunds`: Logged when funds are withdrawn from the shared wallet.
- `TransferFunds`: Logged when funds are transferred to another address.



