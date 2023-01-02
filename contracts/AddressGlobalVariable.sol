// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract AddressGlobalVariable {
    function getBalance(address _addr) public view returns (uint256) {
        return _addr.balance;
    }

    function callTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }
}
