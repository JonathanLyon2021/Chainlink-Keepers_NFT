//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

string constant name = "StarsToken";
string constant symbol = "STRS";

contract StarsToken is ERC721 {

        address public owner;
        uint256 tokenId = 1;

        struct Stars {
            uint tokenId;
            string tokenName;
            address owner;
        }

    Stars[] public allTokens;

        
    mapping(address => Stars[]) public tokenAddress;
    mapping(string => bool) public tokenExists;
    
    constructor() ERC721("StarsToken", "STR"){
        
        owner = msg.sender;
    }

    function getAllTokens() public view returns (Stars[] memory) {
    //return token array
        return allTokens;
    }
   
    function getMyTokens() public view returns (Stars[] memory) {

        return tokenAddress[msg.sender];
    }
    
    function mintToken(string calldata _tokenName) public payable{
        //check to see if token already exists on blockchain, if so send authentication error message.
        require(!tokenExists[_tokenName], "Token already exists!");

        _safeMint(msg.sender, tokenId);

        allTokens.push(Stars(tokenId, _tokenName, msg.sender));

        tokenAddress[msg.sender].push(Stars(tokenId,
        _tokenName,
        msg.sender));

        tokenExists[_tokenName] = true;

        tokenId++;
    }
}

