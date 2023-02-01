// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Day7 {
    address owner;

    modifier isOnwer() {
        require(owner == msg.sender, "Error");
        _;
    }

    constructor() {
        owner = msg.sender;
        require(owner == msg.sender, "Error");
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function getTomorrowUnixTimestamp() public isOnwer view returns(uint) {
        return block.timestamp + 86400;
    }

    function getAddress() public view returns(address) {
        return msg.sender;
    }
}