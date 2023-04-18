// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintAnimalToken is ERC721Enumerable {

    constructor() ERC721("h662Animals", "HAS") {}

    mapping (uint256 => uint256) public animalTypes;

    function mintAnimalToken() public {
        //총 생산량 + 1 번 아이디 생성
        uint256 animalTokenId = totalSupply() + 1;
        
        // 1 ~ 5 범위의 랜덤한 숫자 생성
        uint256 animalType = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, animalTokenId ))) % 5 + 1;

        animalTypes[animalTokenId] = animalType;

        _mint(msg.sender, animalTokenId);
    }


}
