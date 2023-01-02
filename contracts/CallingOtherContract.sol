// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXFromAddress(address _calleeAddr, uint _x) public {
        Callee callee = Callee(_calleeAddr);
        callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
    }

    //권장되지 않는 방식
    function setXandSendEther2(address _calleeAddr, uint _x) public payable {
        Callee callee = Callee(_calleeAddr);
        (bool _success, bytes memory _data) = address(callee).call{
            value: msg.value
        }(abi.encodeWithSignature("setXandSendEther(uint)", _x));
        require(_success);
    }
}
