// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract BridgeToken is Ownable{
    address public tokenAddress;
    mapping(address => uint256) bridgecontracts;

    constructor(address _tokenAddress)  Ownable (msg.sender){
         tokenAddress = _tokenAddress;
    }
    function lockMytoken(uint256 _amount) public {
        require(IERC20(tokenAddress).allowance(msg.sender,address(this))>=_amount);
        IERC20(tokenAddress).transferFrom(msg.sender,address(this),_amount);
        bridgecontracts[msg.sender]+=_amount;
    }
    function widradw(uint256 _amount , address _tokenAddress ) public {
         IERC20(tokenAddress).transfer(msg.sender,_amount);
        bridgecontracts[msg.sender]+=_amount;
    }
 }