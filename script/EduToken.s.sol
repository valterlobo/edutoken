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

        EduToken token = new EduToken(name, symbol, 1000000000, address(this));
        //token = new EduToken(name, symbol, maxSupply, owner);
        console.log(address(token));
        vm.stopBroadcast();
    }
}
