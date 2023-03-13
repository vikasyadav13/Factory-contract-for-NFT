pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC20/ERC20Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.1/contracts/token/ERC20/ERC20Mintable.sol";

contract myERC20 is ERC20, ERC20Detailed, ERC20Burnable, ERC20Mintable {
    constructor(
        string memory name, 
        string memory symbol,
        uint8 decimals, 
        uint256 initialSupply
    ) public ERC20Detailed(name, symbol, decimals) {
        _mint(msg.sender, initialSupply * (10**uint256(decimals)));
    }
}