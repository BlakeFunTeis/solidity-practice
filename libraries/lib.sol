// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";

library test_library {
    function print_internal(uint _int) internal view returns(uint) {
        console.log("print_internal");
        return _int;
    }

    function print_public(uint _int) public view returns(uint) {
        console.log("print_public");
        console.log(_int);
        return _int;
    }
}