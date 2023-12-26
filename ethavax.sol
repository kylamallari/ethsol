// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(address => uint256) public allowance;
    mapping(address => mapping(uint256 => uint256)) public inventory;

    struct Item {
        string name;
        uint256 price;
    }

    Item[] public items;

    constructor() ERC20("Degen", "DGN") {
        items.push(Item("Apple", 50));
        items.push(Item("Samsung", 100));
        items.push(Item("ASUS", 150));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function buyFromMerchant(uint256 itemIndex) public returns (bool) {
        require(itemIndex < items.length, "Item not found");
        Item storage item = items[itemIndex];
        uint256 price = item.price;
        require(balanceOf(msg.sender) >= price, "Your balance is not enough");
        _burn(msg.sender, price);
        inventory[msg.sender][itemIndex]++;

        return true;
    }

    function InventoryItemCount() external view returns (uint256) {
        return items.length;
    }
}
