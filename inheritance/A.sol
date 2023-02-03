// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract A {
    function test_polymorphism() public view returns(uint) {
        console.log("A_polymorphism");
        return 0;
    }

    function test_super() public view virtual {
        console.log("super");
    }
}