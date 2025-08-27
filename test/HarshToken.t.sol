// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/HarshToken.sol";

contract TestContract is Test {
    HarshToken c;
     event Transfer(address indexed from, address indexed to, uint256 amount);
    function setUp() public {
        c = new HarshToken(100000);
    }
        function test_ExpectEmit() public {
        c.mintto(address(this), 100);
        vm.expectEmit(true, true, false, true);
        // The event we expect
        emit Transfer(address(this), 0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 100);
        // The event we get
        c.transfer(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 100);
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
