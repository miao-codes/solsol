// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// 이더리움 전송 방법
contract Edu3 {

    function sendEth(address payable _to)public payable returns(bool){
         bool result = _to.send(msg.value);
    }

    function transferEth(address payable _to)public payable returns(bool){
         _to.transfer(msg.value);
    }

    function callEth(address payable _to)public payable returns(bool){
        (bool result,) = _to.call{value:msg.value , gas:1000}("");
    }

}