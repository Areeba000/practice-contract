// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ERC20Presale is Ownable {
    using SafeERC20 for IERC20;

    IERC20 public token; // ERC-20 token being sold
    AggregatorV3Interface public priceFeed; // Chainlink ETH to USD price feed
    uint256 public tokenRate; // Number of tokens per USD

    event TokensPurchased(address indexed buyer, uint256 ethAmount, uint256 tokenAmount);

    constructor(address _token, address _priceFeed, uint256 _tokenRate) {
        token = IERC20(_token);
        priceFeed = AggregatorV3Interface(_priceFeed);
        tokenRate = _tokenRate;
    }

    function buyTokens() external payable {
        uint256 ethAmount = msg.value;
       
        uint256 usdPrice = getconversionrate(ethAmount);
        uint256 tokenAmount = usdPrice * tokenRate;

        token.safeTransfer(msg.sender, tokenAmount);

        emit TokensPurchased(msg.sender, ethAmount, tokenAmount);
    }

    function withdrawFunds() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function withdrawUnsoldTokens() external onlyOwner {
        uint256 unsoldTokens = token.balanceOf(address(this));
        if (unsoldTokens > 0) {
            token.safeTransfer(owner(), unsoldTokens);
        }
    }

    function changeTokenRate(uint256 newRate) external onlyOwner {
        tokenRate = newRate;
    }
    function getletestestprice()public view returns(uint256){
       (, int256 price, , , ) = priceFeed.latestRoundData();  
       return uint256(price);
    }
    function getconversionrate(uint256 ethamount)public view returns(uint256){
        uint256 ethprice =getletestestprice();
        uint256 ethamountinusd =(ethprice*ethamount);
        return ethamountinusd;
    }

}

