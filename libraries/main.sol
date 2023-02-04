// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "libraries/lib.sol";

contract main {
    using test_library for uint;

    constructor() {
        test_library.print_internal(1);
        test_library.print_public(2);
        uint test_uint_using = 999;
        test_uint_using.print_public();
    }
}