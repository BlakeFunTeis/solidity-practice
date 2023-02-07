// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/utils/ERC721Holder.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract MyNFT is ERC721Enumerable, ERC721Holder, Ownable {

    using SafeMath for uint;

    using Address for address;

    uint maxNftSupply = 10000;

    uint maxNftPurchase = 20;

    bool pause = false;

    uint mintPrice = 0.2 ether;
    constructor(string memory _nftName, string memory _symbol) ERC721(_nftName, _symbol) {
        
    }

    function withdraw() public onlyOwner {
        uint balance = address(this).balance;
        Address.sendValue(payable(msg.sender), balance);
    }

    function ownerMint() public onlyOwner {
        uint supply = totalSupply();
        for (uint i = 0; i < 30; i++) {
            _safeMint(msg.sender, supply + i);
        }
    }

    function clienterMint(uint _total) public isCheckMint(_total) payable {
        for(uint i = 0; i < _total; i++) {
            uint mintIndex = totalSupply();
            if (mintIndex < maxNftSupply) {
                _safeMint(msg.sender, mintIndex);
            }
        }
    }

    function setPause(bool _isPause) public onlyOwner {
        pause = _isPause;
    }

    modifier isCheckMint(uint _total) {
        require(pause == true, "Sale must be active to mint nft");
        require(_total <= maxNftPurchase, "Can only mint 20 tokens as a time");
        require(totalSupply().add(_total) <= maxNftSupply, "Purchase would exceed max supply of nft");
        require(mintPrice.mul(_total) <= msg.value, "Ether value sent is not correct");
        _;
    }
}