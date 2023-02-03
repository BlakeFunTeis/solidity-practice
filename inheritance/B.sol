// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract B {
    constructor() {
        console.log("B");
    }

    function testB_Base() public view {
        console.log("BASE_B");
    }

    function test_override() virtual public view {
        console.log("virtual");
    }

    function test_polymorphism(uint _int) public view returns(uint) {
        console.log("B_polymorphism");
        return _int;
    }

    function test_super(uint _int) public view virtual {
        console.log("super B");
        console.log(_int);
    }
}