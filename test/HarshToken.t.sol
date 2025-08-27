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
   function testTransfer(uint num)public{
        c.mintto(address(this),100000);
         c.Transferto(address(this),100000);
         assertEq(c.balanceOf(address(this)), 200000,"ok");
    }
    function testTransferback()public{
        c.mintto(address(this),100000);
        c.Transferto(0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD, 100000);
        vm.prank(0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD);
        c.mintto(address(this),100000);
        assertEq(c.balanceOf(address(this)), 200000,"ok");
    }
    function testApprovals()public{
          c.mintto(address(this),100000);
          c.approve(0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD,100000);
          vm.prank(0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD);
          c.transferFrom(address(this),0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD,100000);
           assertEq(c.balanceOf(address(this)), 100000,"ok");
    }
    function test_RevertApprovals()public{
          c.mintto(address(this),100000);
          c.approve(0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD,100000);
          vm.prank(0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD);
           vm.expectRevert();
          c.transferFrom(address(this),0x1d0FdbA6a50339F43486b7c37Fe06d031FC2D1DD,200000);
    }
}
