// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HarshToken  is ERC20 { 
    uint public number;
    address owner;

    constructor(uint256 _initialvalue) ERC20("HARSH","MUASH"){
        _mint(msg.sender,_initialvalue);
        owner=msg.sender;
    }

    function mintto(address to , uint amount ) public{
        // require(msg.sender==owner);
        _mint(to,amount);
    }
     function Transferto(address to , uint amount ) public{
        // require(msg.sender==owner);
        transfer(to,amount);
    }
}
