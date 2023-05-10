// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract AddressExample {
    address public currentUser;

    function getAddress() public returns (address) {
        currentUser = msg.sender;
        return msg.sender; //해당 함수를 호출한 주소
    }

    function getBalance() public view returns (uint256) {
        return msg.sender.balance;
    }
}
