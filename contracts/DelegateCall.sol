// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract D {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract C {
    uint public num;
    address public sender;
    uint public value;

    function delegateSetVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }

    function callSetVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}

///-------------------
contract B {
    event CallFuncLog(address _from);

    function callFunc() public payable {
        emit CallFuncLog(msg.sender);
    }
}

contract A {
    function callOtherContract(address _contractAddress) public {
        (bool success1, bytes memory data1) = _contractAddress.call(
            abi.encodeWithSignature("callFunc()")
        );
        (bool success2, bytes memory data2) = _contractAddress.delegatecall(
            abi.encodeWithSignature("callFunc()")
        );

        require(success1);
        require(success2);
        MyLibrary.callmyLibraryFunc();
    }
}

library MyLibrary {
    event CallMyLibraryLog(address _from);

    function callmyLibraryFunc() public {
        emit CallMyLibraryLog(msg.sender);
    }
}
