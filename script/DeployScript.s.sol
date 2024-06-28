// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {ExploitationContract} from "../src/exploitationContract.sol";

contract DeployScript is Script {
    function run()
        external
        returns (ExploitationContract exploitationContract)
    {
        vm.startBroadcast();
        exploitationContract = new ExploitationContract();
        vm.stopBroadcast();
    }
}
