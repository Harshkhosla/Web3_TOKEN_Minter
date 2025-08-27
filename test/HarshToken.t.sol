// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/HarshToken.sol";

contract TestContract is Test {
    HarshToken c;

    function setUp() public {
        c = new HarshToken(100000);
    }
    function testMinting(uint num)public{
         c.mintto(address(this),100000);
         assertEq(c.balanceOf(address(this)), 200000,"ok");
    }
   
}
