// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IAIOracle {
    function getPrediction(string calldata query) external view returns (uint256);
}

contract TradingBot is Ownable {
    IAIOracle public aiOracle;

    event TradeExecuted(address indexed user, uint256 amount, string decision);

    constructor(address _aiOracle) {
        aiOracle = IAIOracle(_aiOracle);
    }

    function executeTrade(string calldata asset, uint256 amount) external {
        uint256 prediction = aiOracle.getPrediction(asset);

        string memory decision = prediction > 50 ? "BUY" : "SELL";

        emit TradeExecuted(msg.sender, amount, decision);
    }
}
