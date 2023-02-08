// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract Details is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor(string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    function name() public view returns(string memory) {
        return _name;
    }

    function symbol() public view returns(string memory) {
        return _symbol;
    }

    function decimals() public view returns(uint8) {
        return _decimals;
    }
}