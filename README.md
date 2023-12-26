# ethsol

DegenToken is a decentralized ERC-20 token written in Solidity with an additional inventory system. This contract enables users to manage token balances, mint and burn tokens, and interact with a basic merchant system.

## Features

- **Minting and Burning:** The contract provides functionality to mint new tokens to designated addresses and burn tokens from the sender's balance.

- **Inventory System:** Users can interact with a simple inventory system, allowing them to purchase items from a predefined list using their token balance.

## Getting Started

1. **Install Dependencies:**
   ```bash
   npm install
   ```

2. **Deploy the Contract:**
   - Deploy the `DegenToken` contract on your preferred Ethereum network.

3. **Mint Tokens:**
   - Use the `mint` function to create and distribute tokens to specific addresses.

4. **Burn Tokens:**
   - Users can burn their tokens using the `burn` function.

5. **Buy Items from Merchant:**
   - Utilize the `buyFromMerchant` function to purchase items from the predefined list.

## Example Usage

```solidity
// Deploy the contract
DegenToken token = new DegenToken();

// Mint tokens to an address
token.mint(address, amount);

// Burn tokens
token.burn(amount);

// Buy item from merchant
token.buyFromMerchant(itemIndex);
```

## Contract Details

- **Name:** DegenToken
- **Symbol:** DGN
- **Inventory Item Count:** Call `InventoryItemCount` to get the number of available items in the inventory.
