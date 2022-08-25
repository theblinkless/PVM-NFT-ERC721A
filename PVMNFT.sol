// SPDX-License-Identifier: MIT
// creators: The Blinkless

// DISCLAIMER: This file is provided for educational purposes only 
// and The Blinkless is not liable for its use or misuse.

pragma solidity ^0.8.4;

import './ERC721A.sol';
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract PVMNFT is ERC721A,Ownable {

    constructor(string memory _metadataPath) ERC721A("My PVM Project", "PVMNFT") {
        //mint initial token to owner
        _mint(msg.sender, 1);
        //set path to metadata
        metadataPath = _metadataPath;
        //set total number of NFTs to be minted with PVM
        maxSupply = 5555; 
    }

    /**
    * Mint a token
    */
    function mint() external onlyOwner{
        require(totalSupply() < maxSupply, "Max supply reached.");
        _mint(msg.sender, 1);
    }

    /**
    * Airdrops - Use this to optionally airdrop tokens to initial holders
    */
    function airdropMint() external onlyOwner{
        _mint(address(msg.sender), 200); // this will mint 200 NFTs to the owner's wallet
    }



    /**
    * Update the base URI for metadata
    * Assumes a full URL or ipfs:// path pointing to token id json files (0.json,1.json,2.json,etc)
    * Example Input: "https://www.mywebsite.com/json/"
    * Example after appended: "https://www.mywebsite.com/json/1.json"
    */
    function updateBaseURI(string memory baseURI) external onlyOwner{
         metadataPath = baseURI;
    }


    /**
    * Update the maxSupply - default is 5555, set in constructor
    */
    function updateMaxSupply(uint256 newSupply) external onlyOwner{
         maxSupply = newSupply;
    }

   
}
