// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract etherwallet{
address public owner;
string public message;
address public placeholder;
enum conditioncheck{available,notavailable}
conditioncheck newmsg;
constructor(string memory _initialmessage) {
    owner=payable (msg.sender);
    message=_initialmessage;
    newmsg=conditioncheck.available;

}
modifier placeholderpersons(){
     require(placeholder == msg.sender ||owner== msg.sender, "you are not authorized to return place");
     _;
}
function changemassage(string memory _newmessage)external payable {
   require(msg.value==1 ether,"not enough ether");
   message=_newmessage;
   placeholder=msg.sender;
   newmsg=conditioncheck.notavailable;

}
function returnplace()external placeholderpersons{
        newmsg = conditioncheck.available;
}
function getcondition()external view returns(conditioncheck){
     return newmsg;

}
function withdraw()external {
    require(owner==msg.sender,"only owner can with draw money");
  payable(owner).transfer(address(this).balance);
}
}
