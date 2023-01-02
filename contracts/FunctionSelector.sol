// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Addr {
    event Msg(bytes data);

    function transfer(address _to, uint _amount) external {
        emit Msg(msg.data);
    }
}

contract FunctionSelector {
    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}

contract ConstantState {
    uint public constant MAX_AGE = 18;
    string public constant FIXED = "abcd";
    address internal constant POSSIBLE_ADDR =
        0xe7a4eb8548A1B7eeA01bB141480Abf0126afcA96;
}
