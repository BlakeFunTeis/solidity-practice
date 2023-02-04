// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";


contract Employee {
    event NewEmployee(string name, uint age) anonymous;
    function hire(string memory name, uint age) public {
        emit NewEmployee(name, age);
    }
}

contract Company is Employee {
    function hireEmployee(string memory name, uint age) public {
        hire(name, age);
    }
}