// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/HarshToken.sol";
import "src/BridgeToken.sol";

contract TestContract is Test {
    HarshToken harshtoken;
    BridgeToken bridgecontract ;
    function setUp() public {
        harshtoken = new HarshToken(100000);
        bridgecontract = new BridgeToken(address(harshtoken));
    }

      function testLockmytoken() public {
        harshtoken.mintto(address(this),200);
        assertEq(harshtoken.balanceOf(address(this)), 100200,"ok");
        harshtoken.approve(address(this),address(bridgecontract),200);
        bridgecontract.lockMytoken(200);
        assertEq(harshtoken.balanceOf(address(this)), 100000,"ok");
        assertEq(harshtoken.balanceOf(address(bridgecontract)), 200,"ok");
      }


}