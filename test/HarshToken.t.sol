// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/HarshToken.sol";

contract TestContract is Test {
    HarshToken c;

    function setUp() public {
        c = new HarshToken(100000);
    }
    function testaddition(uint num)public{
        // c.addnumber(100);
         assertEq(c.number(), 200, "ok");
    }
   
}
