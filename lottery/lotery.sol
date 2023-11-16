// SPDX-License-Identifier: MIT
pragma solidity > 0.8.21;

contract lottery  {
    address public ownner;
    address payable[] public players;

    constructor (){
      ownner=msg.sender;
    }
    modifier owneronly{
      if(msg.sender==ownner){
        _;
      }
    }

    function deposit()public payable{
      require(msg.value>=1 ether);
      players.push(payable(msg.sender));
    }

    function random()private view returns (uint256){
      return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players.length)));

    }
    function pickWinner() public  {
      require(players.length > 0, "No players in the lottery.");
      uint256 randomnumber = random();
      uint256 index = randomnumber % players.length;
      address payable winner = payable(players[index]);
      winner.transfer(address(this).balance);
      delete players;
    }
}
