# SchoolRecord Smart Contract

## Overview

The SchoolRecord smart contract is designed to manage a basic school record system on the Ethereum blockchain. It allows the addition of teachers and students, creation of quizzes, and enables students to take quizzes.

## Smart Contract Details

- **Contract Name**: SchoolRecord
- **Solidity Version**: 0.8.0
- **License**: MIT

## Features

1. **Teacher Management**:
   - The contract owner (the principal) can add and remove teachers by their Ethereum addresses.

2. **Student Management**:
   - Teachers can add students to the system by providing student details such as name, roll number, home address, and class.

3. **Quiz Creation**:
   - Teachers can create quizzes by specifying the quiz name, question, and whether a hint is available for the quiz.

4. **Quiz Taking**:
   - Students can take quizzes by providing their answers. Quizzes are tracked to prevent students from taking the same quiz multiple times.
   - The contract provides feedback to students on whether they passed or failed the quiz based on their answer and the quiz hint.

## Getting Started

Follow the instructions below to deploy and interact with the SchoolRecord smart contract.

### Deployment

1. Deploy the SchoolRecord smart contract on the Ethereum network using your preferred development environment or tools.

### Interaction

![Screenshot 2023-10-27 165720](https://github.com/Areeba000/contract-Practice/assets/140241495/311b7d25-cfeb-4aa5-b05a-3b08722fd820)


![Screenshot 2023-10-27 170049](https://github.com/Areeba000/contract-Practice/assets/140241495/27d67fb8-6fb3-44e9-857f-202d3e769a72)



1. **Adding Teachers**:
   - The principal (contract owner) can add and remove teachers using the `teacheradd` and `teacherremove` functions.

2. **Adding Students**:
   - Teachers can add students to the system using the `addStudent` function by providing student details.

3. **Creating Quizzes**:
   - Teachers can create quizzes using the `createQuiz` function. Specify the quiz name, question, and hint availability.

4. **Taking Quizzes**:
   - Students can take quizzes using the `takeQuiz` function by providing the quiz ID and their answer.

5. **Retrieving Quiz Information**:
   - Students can retrieve quiz details using the `getQuiz` function, which provides the question and quiz name.

## Security Considerations

- The contract uses modifiers to restrict access to certain functions, ensuring that only authorized parties can perform specific actions.
- Ensure that the contract owner (principal) is a trusted address as they can add and remove teachers, which may impact contract security.


