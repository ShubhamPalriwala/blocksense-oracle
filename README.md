# Blocksense Oracle Example

This repository demonstrates the usage of the **Blocksense Oracle**. It provides an example of how to utilize the Blocksense contracts to fetch data from a data feed store. 


This example uses the `Blocksense` contract which proxies calls via the Chainlink Aggregator, specifically designed to fetch data for a single feed. It implements the `IAggregator` interface and provides functionalities to retrieve the latest data from the specified data feed.

### Key Features

- **Immutable Properties**:
  - `decimals`: The number of decimal places for the feed.
  - `key`: The key ID of the feed.
  - `dataFeedStore`: The address of the upgradeable proxy contract on EVM Sepolia.

- **Functions**:
  - `latestAnswer()`: Returns the latest answer from the data feed.
  - `latestRound()`: Returns the latest round ID.
  - `latestRoundData()`: Provides detailed information about the latest round.
  - `getRoundData(uint80 _roundId)`: Fetches data for a specific round ID.

### Constructor

The constructor initializes the contract with the specified decimals and key, and sets the description to "Blocksense on EVM Sepolia".

### Usage

To use the `Blocksense` contract, you need to deploy it with the appropriate decimals and key. Here's an example of how to deploy the contract:

```solidity
Blocksense priceFeed = new Blocksense(
    18, // Decimals for output price
    41 // Feed ID as per https://docs.blocksense.network/docs/contracts/deployed-contracts?network=citrea-testnet#Aggregator%20Proxy%20Contracts
);
```

The entire example is present in the `script/FetchPrice.s.sol` file.

### Running using Foundry

To run the contract using Foundry, you can use the following command:

```bash
forge script script/FetchPrice.s.sol --fork-url <rpc-url> --broadcast
```
