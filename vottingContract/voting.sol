// SPDX-License-Identifier: MIT
pragma solidity > 0.8.21;

contract voting{
    address public contractowner;
    address []public candidateslist;
    mapping(address=>uint8)public voterecived;
    address public winer;
    uint public winervote;
    enum votingsatuts{notstarted ,runing,completed}
    votingsatuts public satuts;

    constructor (){
        contractowner=msg.sender;
    }

    modifier onlyowner{
        if (msg.sender==contractowner){
         _;
        }
    }
    function setsatuts()onlyowner public{
        if(satuts!=votingsatuts .completed){
            satuts=votingsatuts.runing;
        }else{
            satuts=votingsatuts.completed;
            }
    }
    
    function registercandidates(address _candidates)onlyowner public{
        candidateslist.push(_candidates);
    }
    function vote(address _candidates)public{
        require(validatecandidates(_candidates),"not validate candidates");
        require(satuts==votingsatuts.runing, "election is not active");
        voterecived[_candidates]=voterecived[_candidates]+1;
    }

    function validatecandidates(address _candidates) view public returns(bool) {
        for(uint i = 0; i < candidateslist.length; i++) {
        if(candidateslist[i] == _candidates) {
            return true;
        }
    }
           return false;
    }
    function votescount(address _candidates) public view returns(uint) {

        require(validatecandidates(_candidates),"not validate candidates");
       assert(satuts==votingsatuts.runing);
        return voterecived[_candidates];
    }
    function result ()public{
        require(satuts==votingsatuts.completed, "election is not completed");
        for(uint i=0;i<candidateslist.length;i++){
            if(voterecived[candidateslist[i]]>winervote){
                winervote=voterecived[candidateslist[i]];
                winer=candidateslist[i];
            }
        }
    }
}









