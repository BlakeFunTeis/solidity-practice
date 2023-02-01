// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//pragma solidity ^0.7.0;

// Test Underflow and Overflow
contract day8 {
    uint public myUint8;

    function decrement() public {
        myUint8 -= 1;
    }

    function increment() public {
        myUint8 += 1;
    }
}