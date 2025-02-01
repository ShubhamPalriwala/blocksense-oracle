// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {Blocksense} from "../lib/Blocksense.sol";

contract FetchPrice is Script {
    function run() external {
        vm.startBroadcast();

        // Deploy ChainlinkProxy contract
        Blocksense priceFeed = new Blocksense(
            18, // Decimals for output price
            41 // Feed ID as per https://docs.blocksense.network/docs/contracts/deployed-contracts?network=citrea-testnet#Aggregator%20Proxy%20Contracts
        );

        // Fetch the latest price
        (
            uint80 roundId,
            int256 price,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        require(price > 0, "Invalid price");

        console.log("BTC/USD Price:", uint256(price));
        console.log("Timestamp:", updatedAt);
        console.log("Round ID:", roundId);
        console.log("Started At:", startedAt);
        console.log("Answered In Round:", answeredInRound);

        vm.stopBroadcast();
    }
}
