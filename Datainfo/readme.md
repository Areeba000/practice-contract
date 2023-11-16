# Solidity Personal Data Smart Contract

## Overview

This Solidity smart contract allows you to store and manage personal data, including the name, age, address, and father's name of individuals. The contract provides the following features:

- Storing personal data in a structured manner using a Solidity struct.
- Associating each set of personal data with a unique data number.
- Providing a function to set personal data with a unique data number.
- Enabling you to retrieve personal data using the data number.

## Features

- **Personal Data Struct**: The contract defines a struct called `MyData` to organize personal information. It includes fields for the person's name, age, address, and father's name.

- **Data Mapping**: The contract uses a mapping where the keys are unique data numbers, and the values are instances of the `MyData` struct. This allows you to efficiently store and retrieve personal data.

- **setData Function**: You can use the `setData` function to set personal data by specifying a unique data number, name, age, address, and father's name. This data is associated with the data number and stored on the blockchain.


## Usage

Here's how you can interact with the contract:

- **Setting Personal Data**:
  - Call the `setData` function, providing a unique data number, name, age, address, and father's name as parameters. This data will be stored on the blockchain.
  - 

![Screenshot 2023-10-24 105508](https://github.com/Areeba000/contract-Practice/assets/140241495/9ca4a57c-dcd0-4f30-ad1c-b83287ae4319)


![Screenshot 2023-10-24 105606](https://github.com/Areeba000/contract-Practice/assets/140241495/b35881be-2f0f-4744-90c3-0567f17178d3)





