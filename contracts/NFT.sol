// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//To store the URI
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

//To generate unique token IDs
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;

    constructor(address marketplaceAddress) ERC721("Universe Tokens", "UNIV") {
        contractAddress = marketplaceAddress;
    }

    //To mint new tokens
    function createToken(string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        //To enable access of the NFT throughout the marketplace
        setApprovalForAll(contractAddress, true);

        return newItemId;
    }
}
