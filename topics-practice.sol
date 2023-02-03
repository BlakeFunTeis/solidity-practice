// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract Topics_Practice {
    event Transfer(address indexed _from, address indexed _to, uint value);
    event QOCK(address indexed _from, address indexed _to, uint value);
    address owner;
    constructor() {
        owner = msg.sender;
    }

    function testEvent() public payable {
        payable(owner).transfer(msg.value);
        emit QOCK(msg.sender, owner, msg.value);
    }
}