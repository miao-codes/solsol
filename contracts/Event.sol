// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event {
    event AnotherLog();

    event IndexedLog(
        uint256 indexed id,
        address indexed sender,
        string message
    );
    event Log(uint256 id, address sender, string message);

    function emitEvent(uint256 _id, string memory _message) public {
        emit IndexedLog(_id, msg.sender, _message);
        emit Log(_id, msg.sender, _message);
        emit AnotherLog();
    }
}
