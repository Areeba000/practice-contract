//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
contract etherwallet{
    address  payable public owner;
    string public message;
receive()external  payable{}
function  getbalance()public view returns(uint){
    return address(this).balance;
}
constructor(string memory _initialMessage) {
    owner=payable(msg.sender);
    message=_initialMessage;

}
modifier onlyowner{
    require(owner==msg.sender,"not owner");
    _;
}
function withdraw()public payable onlyowner {
    owner.transfer(getbalance());
}
}
