// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import './Edu1.sol';
contract Edu2 {
    Edu1 edu=new Edu1();

     function calculate() public returns(uint256) {
       uint256 a=10;
       uint256 b=20;
       uint256 result = edu.sum(a, b);
       return result;
   }
}
