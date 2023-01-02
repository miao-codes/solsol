// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract GlobalVariable {
    function get7DaysAfter() public view returns (uint) {
        // now는 block.timestemp 의 별칭
        return block.timestamp + 7 days;
    }

    function getBlockCoinbase() public view returns (address) {
        return block.coinbase;
    }

    function getBlockDifficulty() public view returns (uint) {
        return block.difficulty;
    }

    function getBlockNumber() public view returns (uint) {
        return block.number;
    }

    function getTxOrigin() public view returns (address) {
        return tx.origin;
    }

    function getUnicodeText() public pure returns (string memory) {
        return "hi  \u1F603";
    }
}
