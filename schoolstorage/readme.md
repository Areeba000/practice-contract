# SchoolRecord Smart Contract

The `SchoolRecord` smart contract is designed to maintain school records for students. It provides functionality for the principal to manage teachers and for teachers to add student records. Below is an overview of the contract, its functions, and how to use it:

## Solidity Version

The contract is written in Solidity version 0.8.0.

## Contract Overview

The `SchoolRecord` contract consists of the following components:

- `principal`: An address variable representing the principal of the school. The principal is the one who can manage teachers.
- `Student` struct: A structured data type that stores information about a student, including their name, roll number, home address, and class.
- `students` mapping: A mapping that associates each student's roll number with their corresponding data (Student struct).
- `teacher` mapping: A mapping that associates each teacher's address with a boolean value indicating whether they are authorized to add student records.

## Modifiers

The contract defines two modifiers:

- `onlyPrincipal`: Ensures that a function can only be executed by the principal of the school.
- `onlyteacher`: Ensures that a function can only be executed by authorized teachers.

## Functions

The contract provides the following functions:

- `teacheradd(address _teacher)`: Allows the principal to add a teacher's address to the list of authorized teachers.
- `teacherremove(address _teacher)`: Allows the principal to remove a teacher's authorization.
- `addStudent(string memory name, uint256 rollno, string memory homeaddress, uint class)`: Allows authorized teachers to add student records by providing the student's name, roll number, home address, and class.

## Interacting with the Contract

Here's how you can interact with the `SchoolRecord` smart contract:

1. **Deploy the Contract**: Deploy the contract, and the deployer becomes the principal by default.

2. **Add Teachers**: The principal can use the `teacheradd` function to add teacher addresses to the list of authorized teachers.

3. ![Screenshot 2023-10-27 122939](https://github.com/Areeba000/contract-Practice/assets/140241495/ec20e521-5837-492a-a0a7-537be8405556)


4. **Remove Teachers**: The principal can use the `teacherremove` function to remove teacher authorizations.


5. ![Screenshot 2023-10-27 123205](https://github.com/Areeba000/contract-Practice/assets/140241495/e3f0e4be-0f2d-4b58-9ef6-0035d904d15f)


6. **Add Student Records**: Authorized teachers can use the `addStudent` function to add student records to the contract by providing the required information.

