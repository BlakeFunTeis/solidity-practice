// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract Exceptions {

    event Log(address indexed _from, uint _total);

    address owner;

    mapping (address => uint) whiteList;

    uint mintLimit = 24;

    uint mintPrice = 0.2 ether;

    bool pause = false;

    constructor() {
        owner = msg.sender;        
    }

    modifier isCheckOwner() {
        require(owner == msg.sender, "is not owner");
        _;
    }

    modifier isCheckMint() {
        require(block.timestamp >= 1672502400, "Error1");
        require(whiteList[msg.sender] <= mintLimit, "Error2");
        _;
    }

    function mint(uint _total) public isCheckMint payable returns(bool) {
        require(_total > 0, "mint total < 0");
        require(msg.value >= (mintPrice * _total), "Not enough ether");
        whiteList[msg.sender] += _total;
        emit Log(msg.sender, _total);
        return true;
    }

    function getTotal() public view returns(uint) {
        return whiteList[msg.sender];
    }

    function getEther() public isCheckOwner {
        payable(owner).transfer(address(this).balance);
    }

    function testAssert() public view {
        assert(pause == false);
    }

    function setPause(bool _bool) public {
        pause = _bool;
    }

    function getPause() public view returns(bool) {
        return pause;
    }

    receive() payable external {
        console.log(1);
        // payable(msg.sender).transfer(msg.value);
    }
}