pragma solidity ^0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC721/ERC721Mintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC721/ERC721MetadataMintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC721/ERC721Holder.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/drafts/Counters.sol";

contract myERC721 is
    ERC721Full,
    ERC721Mintable,
    ERC721MetadataMintable,
    ERC721Holder
{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event awardNewItem(uint256 indexed newID);

    constructor(
        string memory name,
        string memory symbol,
        string memory baseURI 
    ) public ERC721Full(name, symbol) {
        _setBaseURI(baseURI);
    }

    function awardItem(
        address player,
        string memory _tokenURI
    ) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        mint(player, newItemId);
        _setTokenURI(newItemId, _tokenURI);

        return newItemId;
    }
}