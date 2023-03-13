pragma solidity ^0.8.9;

import "./myERC721.sol";
import "./myERC20.sol";

contract tokenFactory {

    address[] tokenAddress;
 
    function deploy721Contract(
        string calldata name,
        string calldata symbol,
        string calldata baseUrl
    ) external returns (myERC721 cardAddress) {

        myERC721 newCards = new myERC721(name, symbol, baseUrl);

        tokenAddress.push(address(newCards));
        return newCards;
    }

    function deploy20Contract(
        string calldata name,
        string calldata symbol,
        uint8 decimals,
        uint256 initialSupply
    ) external returns (myERC20 creditsAddress) {

        myERC20 newCredits = new myERC20(
            name,
            symbol,
            decimals,
            initialSupply
        );

        tokenAddress.push(address(newCredits));
        return newCredits;
    }

}