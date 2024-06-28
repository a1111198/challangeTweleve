// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {ChallangeTwelve} from "../src/ ChallangeTwelve.sol";
import {LessonTwelveHelper} from "../src/hellContract.sol";
import {ExploitationContract} from "../src/exploitationContract.sol";

contract InvariantTest is Test {
    ChallangeTwelve challangeTwelve;
    LessonTwelveHelper lessonTwelveHelper;

    function setUp() external {
        challangeTwelve = new ChallangeTwelve();
        vm.prank(address(challangeTwelve));
        lessonTwelveHelper = new LessonTwelveHelper();
    }

    function test_solve2() external {
        vm.startPrank(0x5508459A9622F327b05eB0AA85971fc9B2Ea9a8d);
        ExploitationContract exploitationContract = new ExploitationContract();
        console.log();
        assert(
            challangeTwelve.solveChallenge(
                address(exploitationContract),
                lessonTwelveHelper
            ) == true
        );
        vm.stopPrank();
    }
}
