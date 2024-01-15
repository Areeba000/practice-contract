// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract vesting{
IERC20 public token;
address public reciver;
uint256 public expiry;
uint256 public amount;
bool public locked=false;
bool public claimed=false;

constructor(address _token){
    token=IERC20(_token);
}
function lock(address _from,address _reciveer,uint256 _amount,uint256 _expairy)external{
    require(!locked,"already locked");
    token.transferFrom(_from, address(this), _amount);
    reciver=_reciveer;
    expiry=_expairy;
    amount=_amount;
}
function withdraw()external {
    require(block.timestamp>expiry,"token have been not unlocked");
    require(!claimed,"already claimed");
    claimed=true;
    token.transfer(reciver,amount);
}
function gettime()external view returns(uint256){
    return block.timestamp;
}
function extendVesting(uint256 _newExpiry) external  {
    require(_newExpiry > expiry, "New expiry must be greater than the current expiry");
    expiry = _newExpiry;

    }

}