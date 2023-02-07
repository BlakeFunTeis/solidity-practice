// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/utils/SafeERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract ERC20Practice is ERC20 {

    using SafeERC20 for IERC20;

    using Address for address;

    IERC20 token = IERC20(address(this));
    
    constructor() ERC20("FFF2", "UUU") {
        _mint(msg.sender, 10000000);
    }

    function safeTransferFrom_test() public {
        token.safeTransferFrom(msg.sender, address(this), 100);
    }

    function safeTransfer_test(uint _amount) public {
        token.safeTransfer(msg.sender, _amount);
    }

    function isContract_test(address _address) public view returns(bool) {
        return address(_address).isContract();
    }

    function sendValue_test(address _address) public payable {
        Address.sendValue(payable(address(_address)), 100);
        
    }

    receive() payable external {}
}