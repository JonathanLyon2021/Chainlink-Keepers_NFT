//SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ColorToken is ERC721 {

        address public owner;
        uint256 tokenId = 1;

        struct Color {
            uint tokenId;
            string tokenName;
            address owner;
        }
        }
