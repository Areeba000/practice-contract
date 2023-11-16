# Solidity Contact Book Smart Contract

## Overview

This Solidity smart contract allows you to manage a simple contact book on the Ethereum blockchain. The contract provides the following features:

- Adding new contacts with associated phone numbers.
- Retrieving the phone number of a contact by their name.
- Listing all contact names and their corresponding phone numbers.

## Features

- **Contact Struct**: The contract defines a struct called `Contact` to represent a contact. It includes fields for the contact's phone number and a flag to check if the contact exists.

- **Mapping for Contact Data**: The contract uses a mapping to associate contact names with their corresponding `Contact` structs. This mapping allows efficient storage and retrieval of contact data.

- **Arrays for Listing**: Two private arrays, `contactNames` and `contactNumbers`, are used to store the list of contact names and their corresponding phone numbers. These arrays enable you to retrieve all contact information.

- **addContact Function**: You can use the `addContact` function to add a new contact by providing a name and a phone number. This function also updates the mapping and arrays.

- **getContactNumber Function**: The `getContactNumber` function allows you to retrieve the phone number of a contact by providing their name.

- **getAllContactNames Function**: This function retrieves all contact names and their corresponding phone numbers in two arrays, making it easy to list all contacts.

## Usage

Here's how you can interact with the contract:

- **Adding a Contact**:
  - Call the `addContact` function, providing a unique name and a phone number. This function will add the contact and store the data.

- **Getting a Contact's Phone Number**:
  - Use the `getContactNumber` function to retrieve the phone number of a contact by providing their name.

- **Listing All Contacts**:
  - Call the `getAllContactNames` function to obtain two arrays containing all contact names and their corresponding phone numbers.
  - 

![Screenshot 2023-10-24 114608](https://github.com/Areeba000/contract-Practice/assets/140241495/22f36794-992d-4e3c-b58b-3cb4f46f9f83)





