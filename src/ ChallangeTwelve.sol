// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import {LessonTwelveHelper} from "./hellContract.sol";
import {console} from "forge-std/Test.sol";

contract ChallangeTwelve {
    error LessonTwelve__AHAHAHAHAHA1();
    error LessonTwelve__AHAHAHAHAHA2();
    error LessonTwelve__AHAHAHAHAHA3();

    function solveChallenge(
        address exploitContract,
        LessonTwelveHelper i_hellContract
    ) external returns (bool) {
        (bool successOne, bytes memory numberrBytes) = exploitContract.call(
            abi.encodeWithSignature("getNumberr()")
        );

        (bool successTwo, bytes memory ownerBytes) = exploitContract.call(
            abi.encodeWithSignature("getOwner()")
        );

        if (!successOne || !successTwo) {
            revert LessonTwelve__AHAHAHAHAHA1();
        }

        // uint128 numberr;
        address exploitOwner;
        // Ensure the decoding is done correctly
        uint128 numberr;
        numberr = abi.decode(numberrBytes, (uint128));
        exploitOwner = abi.decode(ownerBytes, (address));
        console.log("number is", numberr);

        if (msg.sender != exploitOwner) {
            revert LessonTwelve__AHAHAHAHAHA2();
        }

        try i_hellContract.hellFunc(numberr) returns (uint256) {
            return false;
        } catch {
            return true;
        }
    }
}
