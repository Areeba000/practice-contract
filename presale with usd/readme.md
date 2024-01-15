# ERC20Presale Smart Contract

## Overview

The ERC20Presale smart contract is a simple Ethereum-based contract designed to facilitate the sale of ERC-20 tokens in exchange for Ether (ETH). The contract includes features such as buying tokens, withdrawing funds, withdrawing unsold tokens, and changing the token rate.

## Features

- **Buy Tokens:** Users can purchase tokens by sending Ether to the contract. The number of tokens received is calculated based on the provided Ether amount and the current token rate.

- **Withdraw Funds:** Only the contract owner can withdraw the Ether funds accumulated in the contract.

- **Withdraw Unsold Tokens:** The contract owner can withdraw any unsold tokens back to their own address.

- **Change Token Rate:** The contract owner has the ability to change the token rate, adjusting the conversion rate between Ether and tokens.

## Getting Started

### Prerequisites

- Ethereum Wallet or compatible client
- ERC-20 tokens to sell
- [Chainlink Price Feed](https://docs.chain.link/docs/get-the-latest-price/) contract address for ETH to USD conversion

### Installation

1. Deploy the ERC20Presale contract on the Ethereum network, providing the ERC-20 token address, Chainlink Price Feed contract address, and initial token rate.

2. Interact with the contract using Ethereum Wallet, web3.js, ethers.js, or any other Ethereum-compatible tool.

## Usage

1. **Buying Tokens:**
   - Send Ether to the contract address using the `buyTokens` function.
   - Tokens will be transferred to your address based on the provided Ether amount and the current token rate.

   ```javascript
   // Example using ethers.js
   const erc20Presale = new ethers.Contract(contractAddress, contractABI, wallet);
   await erc20Presale.buyTokens({ value: ethers.utils.parseEther("1") });
   ```

2. **Withdrawing Funds:**
   - Only the contract owner can withdraw funds using the `withdrawFunds` function.

   ```javascript
   // Example using ethers.js
   await erc20Presale.withdrawFunds();
   ```

3. **Withdrawing Unsold Tokens:**
   - Only the contract owner can withdraw unsold tokens using the `withdrawUnsoldTokens` function.

   ```javascript
   // Example using ethers.js
   await erc20Presale.withdrawUnsoldTokens();
   ```

4. **Changing Token Rate:**
   - Only the contract owner can change the token rate using the `changeTokenRate` function.

   ```javascript
   // Example using ethers.js
   await erc20Presale.changeTokenRate(newRate);
   ```
