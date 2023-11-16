// SPDX-License-Identifier: MIT

pragma solidity >=0.8.21;

contract carrent{
    address payable public carowner;
    enum carrentconditions{Available,rented}
    carrentconditions car;
    event rented(address _customer,uint _amount);

    modifier statutserror{
        require(car==carrentconditions.Available,"the car is already rented");
        _;
    }
    modifier paymenterror(uint _ether){
        require(msg.value >= _ether, "not enough ETH");
        _;
    }
    constructor(){
        carowner=payable(msg.sender);
        car=carrentconditions.Available;
    }
    function getcondition()public view returns(carrentconditions){
        return car;
    }
    function rentcar()payable public statutserror paymenterror(2 ether){
     carowner.transfer(msg.value);
     car=carrentconditions.rented;
     emit rented(msg.sender,msg.value);
    }
    function returncar()public{
        car=carrentconditions.Available;
    }
    receive  ()payable external statutserror paymenterror(2 ether){
     carowner.transfer(msg.value);
     car=carrentconditions.rented;
     emit rented(msg.sender,msg.value);
    }
}