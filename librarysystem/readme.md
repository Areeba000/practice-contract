# Library System Smart Contract

This is a Solidity smart contract for a simple library system. It allows users to add books, borrow books, and return books. It also includes a special "warden" role that can withdraw funds from the contract.

## Features

- Add books to the library.
- Borrow books and specify the number of days to borrow.
- Return books to the library.
- "Warden" can withdraw ether from the contract.

## Usage

![Screenshot 2023-11-07 114555](https://github.com/Areeba000/contract-Practice/assets/140241495/b91f9ce6-68b5-4bb1-9e2d-bfe451f09f21)


### Contract Deployment

1. Deploy the contract to the Ethereum blockchain.

### Initialization

1. During deployment, the deployer's Ethereum address will be set as the "warden."

### Adding Books

1. Call the `addBook` function with the book's title and author to add a new book to the library.

### Borrowing Books

1. Call the `borrowBook` function with the book ID and the number of days to borrow.
2. Send 1 ether as payment to borrow a book.
3. The book will be marked as unavailable, and the due date will be set.

### Returning Books

1. Call the `returnBook` function with the book ID to return a book to the library.

### Warden Withdrawal

1. Only the "warden" can call the `withdraw` function to withdraw ether from the contract.

## Modifiers

- `onlyAvailable`: Ensures that a book is available for borrowing.
- `onlywarden`: Restricts functions to the "warden" only.

## Smart Contract State

- The contract maintains a list of books with their details, including availability and due dates.
- It keeps track of the book count.
- The "warden" address is set during contract deployment.

## Smart Contract Balance

- The contract holds a balance in ether, which can be withdrawn by the "warden" using the `withdraw` function.
