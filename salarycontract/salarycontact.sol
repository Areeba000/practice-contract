// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract SalarySystem {
    struct employeedata {
        string Name;
        uint lastSalaryTransferTime;
        uint totalAmount;
    }

    mapping (address => employeedata) public employeeInfo;
    address public owner;
    mapping(address => uint256) public salaries;

    event SalaryPaid(address employee, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can execute");
        _;
    }

    modifier validEmployee(address employee) {
        require(salaries[employee] > 0, "Employee not found");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Function to set an employee's salary and name (only callable by the owner)
    function setSalary(address employee, uint256 amount, string memory _name) public onlyOwner {
        salaries[employee] = amount;
        employeeInfo[employee].Name = _name;
    }

    // Function to pay an employee's salary (only callable by the owner)
    function paySalary(address employee) public validEmployee(employee) onlyOwner {
        uint256 salary = salaries[employee];
        // Implement payment logic, transfer salary to the employee  
        payable(employee).transfer(salary);

        // Update last salary transfer time and total amount
        employeeInfo[employee].lastSalaryTransferTime = block.timestamp;
        employeeInfo[employee].totalAmount += salary;

        emit SalaryPaid(employee, salary);
    }

    // Function to check an employee's balance and retrieve their name
    function checkBalance() public view returns (uint256, string memory) {
        require(salaries[msg.sender] > 0, "You are not an employee");
        return (salaries[msg.sender], employeeInfo[msg.sender].Name);
    }

    receive() external payable { }

    // Function to get an employee's data (last salary transfer time, total amount, and name)
    function getEmployeeData(address employee) public view returns (uint, uint, string memory) {
        return (employeeInfo[employee].lastSalaryTransferTime, employeeInfo[employee].totalAmount, employeeInfo[employee].Name);
    }
}
