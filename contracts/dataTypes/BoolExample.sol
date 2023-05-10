// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract BoolExample {
    bool isSuccess;
    bool public isOn = true;
    bool public isStart = false;

    function set(bool state) public {
        isSuccess = state;
    }

    function get() public view returns (bool) {
        return isSuccess;
    }
}
