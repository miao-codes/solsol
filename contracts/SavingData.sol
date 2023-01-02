// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract SavingData {
    struct Stock{
            string name;
            string symbol;
            string price;
    }

    function structParam1(Stock calldata _stock) public pure returns(Stock memory) {
        string memory _symbol = _stock.symbol;
        Stock memory newStock= _stock;
        string memory symbol = newStock.symbol;
        return newStock;
    }

   function structParam2(Stock memory _stock) public pure returns(Stock memory) {
       // string memory is not implicitly convertible to expected type string calldata.
        //string calldata _symbol = _stock.symbol;
        Stock memory newStock= _stock;
        string memory symbol = newStock.symbol;
        return newStock;
    }

        function momoryParam(uint[] memory nums) public pure returns(uint[] memory) {
        nums[0]=5;
        uint[] memory newNums=nums;
        return newNums;
    }
     function calldataParam(uint[] calldata nums) public pure returns(uint[] calldata) {
         // Error: calldata arrays are read-only
        //nums[0]=5;
        uint[] calldata newNums=nums;
        return newNums;
    }
}


