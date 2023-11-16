// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract SchoolRecord {
    address public principal;

    struct Student {
        string name;
        uint256 rollno;
        string homeaddress;
        uint class;
    }
    
    struct Quiz {
        string quizName;
        string question;
        bool hint;
        mapping(address => uint) scores;
        mapping(address => bool) answers;
    }

    mapping (address => mapping(uint256 => bool)) public quizTaken;
    mapping(uint256 => Quiz)public quizzes;
    mapping(uint256 => Student) public students;
    mapping(address=>bool) public teacher;
    uint256 public quizCount;
    constructor() {
        principal = msg.sender;
        teacher[msg.sender] = true;
    }

    modifier onlyPrincipal() {
        require(msg.sender == principal, "Only the principal can add teacher");
        _;
    }
    modifier onlyteacher() {
        require(teacher[msg.sender], "Only the teacher can add students");
        _;
    }
    modifier onlystudent(uint256 _rollno){
        require(students[_rollno].rollno==_rollno,"you are not student");
        _;
    }

    function teacheradd(address _teacher)public onlyPrincipal{
        teacher[_teacher]=true;
    }

    function teacherremove(address _teacher)public onlyPrincipal{
        teacher[_teacher]=false;
        
    }
    function addStudent( string memory name, uint256 rollno, string memory homeaddress, uint class ) public onlyteacher  {
        students[rollno] = Student(name, rollno, homeaddress, class);
    }
    function createQuiz(string memory _quizName, string memory _question,bool _hint) public  onlyteacher{
        quizCount++;
        quizzes[quizCount].quizName = _quizName;
        quizzes[quizCount].question = _question;
        quizzes[quizCount].hint=_hint;
        
    }
    function getQuiz(uint256 _quizCount)public  view  onlystudent( _quizCount ) returns(string memory,string memory){
        return (quizzes[_quizCount].question,quizzes[_quizCount].quizName) ;
    }
    function takeQuiz(uint256 _quizCount, bool answer)public onlystudent( _quizCount ) returns(string memory)  {
        require(!quizTaken[msg.sender][_quizCount], "already answered");
        quizzes[_quizCount].answers[msg.sender] = answer;
        quizTaken[msg.sender][_quizCount] = true;
        if(quizzes[_quizCount].answers[msg.sender]== quizzes[quizCount].hint){
            return "you pass";
        }else{
            return "you fail";
        }

    }
}
