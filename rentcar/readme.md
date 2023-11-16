# Car Rental Smart Contract

This is a simple Ethereum smart contract written in Solidity for car rentals. It allows users to rent and return a car, with automatic handling of rental payments.

## Features

- Rent a car by sending 2 Ether to the contract.
  
- Return the car to make it available for rent again.
  
- Logs rental events, including the customer's address and rental amount.
  
- Prevents double-renting or underpayment.

## Usage

### Renting a Car

To rent a car, send 2 Ether to the contract. Make sure the car is available (not already rented). If the car is available and you send enough Ether, the contract will log the rental and transfer the payment to the car owner.

### Returning the Car

To return the car, call the `returncar` function. This sets the car's status back to "Available," making it ready for the next rental.

## Smart Contract Details

- `carowner`: The Ethereum address of the car owner, who receives rental payments.
  
- `car`: An enumeration to track the car's status (Available or Rented).
  
- `rented` event: Logs rental events, including the customer's address and rental amount.
  
- `statutserror` modifier: Ensures the car is available for rental.
  
- `paymenterror` modifier: Checks if the sent value is sufficient for rental payment.
