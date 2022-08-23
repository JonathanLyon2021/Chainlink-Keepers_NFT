//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

string constant name = "StarToken";
string constant symbol = "STR";

contract StarToken is ERC721 {

        address public owner;
        uint256 tokenId = 1;

        struct Star {
            uint tokenId;
            string tokenName;
            address owner;
        }

    Star[] public allTokens;

        
    mapping(address => Star[]) public tokenAddress;
    mapping(string => bool) public tokenExists;
    
    constructor() ERC721("StarToken", "STR"){
        
        owner = msg.sender;
    }

    function getAllTokens() public view returns (Star[] memory) {
    //return token array
        return allTokens;
    }
   
    function getMyTokens() public view returns (Star[] memory) {

        return tokenAddress[msg.sender];
    }
    
    function mintToken(string calldata _tokenName) public payable{
        //check to see if token already exists on blockchain, if so send authentication error message.
        require(!tokenExists[_tokenName], "Token already exists");

        _safeMint(msg.sender, tokenId);

        allTokens.push(Star(tokenId, _tokenName, msg.sender));

        tokenAddress[msg.sender].push(Star(tokenId,
        _tokenName,
        msg.sender));

        tokenExists[_tokenName] = true;

        tokenId++;
    }
}

