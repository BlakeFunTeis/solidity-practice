// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/utils/SafeERC20.sol";


contract ERC20Practice is ERC20 {

    using SafeERC20 for IERC20;

    constructor(uint initSupply) ERC20("FFF2", "UUU") {
        _mint(msg.sender, initSupply);
    }

    function safeTransferFrom_test() public {
        IERC20 token = IERC20(address(this));
        token.safeTransferFrom(msg.sender, address(this), 100);
    }
}