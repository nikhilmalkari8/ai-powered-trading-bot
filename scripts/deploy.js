require("dotenv").config();
const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Replace with the actual AI Oracle contract address on Base
  const AI_ORACLE_ADDRESS = "0xYourAIOracleContractAddress"; 

  // Compile and deploy the TradingBot contract
  const TradingBot = await ethers.getContractFactory("TradingBot");
  const tradingBot = await TradingBot.deploy(AI_ORACLE_ADDRESS);

  await tradingBot.deployed();

  console.log("TradingBot deployed to:", tradingBot.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
