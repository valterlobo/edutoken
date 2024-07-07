// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import "../src/EduToken.sol";

contract DeployToken is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        string memory name = "EduToken";
        string memory symbol = "$EDTK";
        uint256 maxSupply = 1000000000e18;
        address owner = vm.envAddress("OWNER_CONTRACT");

        EduToken token = new EduToken(name, symbol, maxSupply, owner);
        console.log(address(token));
        vm.stopBroadcast();
    }
}

contract MintToken is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        address tkContract = vm.envAddress("TK_CONTRACT");
        EduToken token = EduToken(payable(tkContract));
        address to = payable(vm.envAddress("TO_MINT"));
        token.mint(to, 1200e18);
        uint256 b = token.balanceOf(to);
        console.log(b);
        vm.stopBroadcast();
    }
}
