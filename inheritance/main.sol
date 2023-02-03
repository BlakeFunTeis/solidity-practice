// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "inheritance/B.sol";
import "inheritance/A.sol";
contract main is B,A {
    constructor() B() {
        console.log("main");
    }

    function test_override() override(B) public view {
        console.log("orverride");
    }

    function main_polymorphism() public view {
        test_polymorphism();
        test_polymorphism(1);
    }

    function test_super() public view override(A) {
        console.log("main_super");
    }

    function test_run_super() public view {
        test_super();
        super.test_super();
        super.test_super(2);
        A.test_super();
        B.test_super(99);
    }
}