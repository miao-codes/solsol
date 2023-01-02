// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Edu4 {
    uint constant SECRET_NUM = 32**22 + 8;
    string constant TEXT = "abc";
    bytes32 constant MY_HASH = keccak256("abc");

    uint[] public myArray = [1, 3, 5, 7, 9];

    // Getter function generated by the compiler
    function getElementFromArray(uint i) public view returns (uint) {
        return myArray[i];
    }

    function externalCall(uint i) public view returns (uint) {
        uint num = this.myArray(i);
        return num;
    }

    // function that returns entire array
    function getArray() public view returns (uint[] memory) {
        return myArray;
    }
}

contract Complex {
    struct Stock {
        uint index;
        string symbol;
        uint price;
        mapping(address => uint) dividendRate;
    }
    mapping(uint => mapping(address => Stock[])) public stock;
}

contract Ownable {
    constructor() public {
        owner = payable(msg.sender);
    }

    address payable owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this functioon");
        _;
    }
}

contract Stock is Ownable {
    function deleteStockInfo() public onlyOwner {
        //...
    }

    function sendStock() public payable {
        require(msg.value > 0, "this address value is 0");
        //..
    }
}