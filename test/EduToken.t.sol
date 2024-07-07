// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {EduToken} from "../src/EduToken.sol";

contract EduTokenTest is Test {
    string public constant name = "EdutToken";
    string public constant symbol = "$EDU";
    uint256 maxSupply = 1000000000e18;
    uint256 initialMint = 1000e18;

    EduToken public token;
    address owner = address(0x1);
    address recipient = address(0x2);
    address alice = vm.addr(0x3);
    address bob = vm.addr(0x4);
    address maria = vm.addr(0x5);
    address joao = vm.addr(0x6);

    function setUp() public {
        vm.startPrank(owner);
        token = new EduToken(name, symbol, maxSupply, owner);
        token.mint(owner, initialMint);
        vm.deal(owner, 10 ether);
        vm.stopPrank();
    }

    function testMaxSupply() public view {
        assertEq(maxSupply, token.cap());
    }

    function testBalanceOfOwner() public view {
        uint256 balance = token.balanceOf(owner);
        console.log(balance);
        assertEq(balance, initialMint);
    }

    function testTransfer() public {
        uint256 amount = 10e18;
        vm.startPrank(owner);
        token.transfer(recipient, amount);
        vm.stopPrank();

        uint256 balanceOwner = token.balanceOf(owner);
        uint256 balanceRecipient = token.balanceOf(recipient);

        assertEq(balanceOwner, (initialMint - amount));
        assertEq(balanceRecipient, amount);
    }

    function testFuzzTransfer(address to, uint256 amount) external {
        vm.assume(to != address(0));
        vm.assume(to != address(this));
        vm.assume(to > joao);
        vm.assume(amount > 0);

        uint256 amountDecimals = amount;

        if (amountDecimals <= token.cap()) {
            vm.startPrank(owner);
            token.mint(address(this), amountDecimals);
            vm.stopPrank();

            assertTrue(token.transfer(to, amountDecimals));
            assertEq(token.balanceOf(address(this)), 0);
            assertEq(token.balanceOf(to), amountDecimals);
        }
    }

    function testMint() public {
        vm.startPrank(owner);
        token.mint(alice, 2e18);
        assertEq(2e18, token.balanceOf(alice));
        vm.stopPrank();
    }

    function testBurn() public {
        vm.startPrank(owner);
        token.mint(bob, 10e18);
        assertEq(token.balanceOf(bob), 10e18);
        vm.stopPrank();

        //bob burn
        vm.startPrank(bob);
        token.burn(8e18);
        assertEq(token.balanceOf(bob), 2e18);
        vm.stopPrank();
    }

    function testApproveAndTransferFrom() public {
        uint256 amount = initialMint;
        vm.startPrank(owner);
        token.approve(recipient, amount);
        vm.stopPrank();

        vm.startPrank(recipient);
        token.transferFrom(owner, recipient, amount);
        vm.stopPrank();

        uint256 balanceOwner = token.balanceOf(owner);
        uint256 balanceRecipient = token.balanceOf(recipient);

        assertEq(balanceOwner, 0);
        assertEq(balanceRecipient, amount);
    }

    function testFailTransferInsufficientBalance() public {
        vm.startPrank(owner);
        token.mint(maria, 2e18);
        assertEq(2e18, token.balanceOf(maria));
        vm.stopPrank();

        vm.prank(maria);
        token.transfer(bob, 3e18);
        vm.stopPrank();
    }

    function testFailFuzzTransferFromInsufficientBalance(
        address from,
        address to,
        uint256 mintAmount,
        uint256 sentAmount
    ) external {
        sentAmount = bound(sentAmount, mintAmount + 1, type(uint256).max);

        vm.startPrank(owner);
        token.mint(from, mintAmount);
        vm.stopPrank();

        vm.prank(from);
        token.approve(to, type(uint256).max);
        token.transferFrom(from, to, sentAmount);
        vm.stopPrank();
    }

    function testFailFuzzTransferFromInsufficientApprove(address from, address to, uint256 approval, uint256 amount)
        external
    {
        amount = bound(amount, approval + 1, type(uint256).max);

        vm.startPrank(owner);
        token.mint(from, amount);
        vm.stopPrank();

        vm.prank(from);
        token.approve(address(this), approval);
        token.transferFrom(from, to, amount);
    }

    function testFailFuzzBurnInsufficientBalance(address to, uint256 mintAmount, uint256 burnAmount) external {
        burnAmount = bound(burnAmount, mintAmount + 1, type(uint256).max);

        vm.startPrank(owner);
        token.mint(to, mintAmount);
        vm.stopPrank();

        vm.startPrank(to);
        token.burn(burnAmount);
        vm.stopPrank();
    }

    function testFailExceededCap() public {
        vm.startPrank(owner);
        assertTrue(token.totalSupply() <= token.cap());
        token.mint(maria, maxSupply * 2);
        vm.stopPrank();
    }
}
