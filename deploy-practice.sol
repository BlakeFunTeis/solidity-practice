// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DeployA {
    function deploy() public returns(uint) {
        A TestA = new A();
        uint myUint8 = TestA.getMyUint8();
        return myUint8;
    }
}

contract A {
    uint public myUint8;

    constructor() {
        myUint8 = 40;
    }

    function getMyUint8() public view returns(uint) {
        return myUint8;
    }
}

