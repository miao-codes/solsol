// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Visibility {
    uint256 price = 10;
    uint256 public price2 = 20;
    uint256 private price3 = 30;
    uint256 internal price4 = 40;

    // uint256 external price5=50;

    function add() public returns (uint256) {
        return price + price2;
    }
}

contract Base {
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
