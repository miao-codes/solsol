// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BytesExample {
    bytes1[] expensiveByte; //(x)
    bytes cheaperByte2; //(o)

    bytes32 bytes32Text;

    bytes single = "0x1";
    bytes a = "hello ";
    bytes32 b = "this is bytes32";
    bytes32 d = "Lorem Ipsum is simply dummy text";
    bytes e =
        "Lorem Ipsum is simply dummy text of the printing and typesetting";
    string c =
        "Lorem Ipsum is simply dummy text of the printing and typesetting";
    bytes addr = "0xA0c68C";

    function stringToBytes(
        string calldata text
    ) public pure returns (bytes memory) {
        bytes memory byteText = bytes(text);
        return byteText;
    }

    function byteToString(
        bytes calldata code
    ) public pure returns (string memory) {
        string memory text = string(code);
        return text;
    }

    function getLength() public view returns (uint) {
        return bytes32Text.length;
    }

    function getLength2(bytes calldata text) public pure returns (uint) {
        return text.length;
    }

    function compare(
        string calldata s1,
        string calldata s2
    ) public pure returns (bool) {
        // bool result= s1==s2;
        bool result = keccak256(abi.encodePacked(s1)) ==
            keccak256(abi.encodePacked(s2));
        return result;
    }

    // string은 가변인데 이를 고정바이트배열로 변경하는 함수
    // 어떠한 contract가 다른 contract를 string으로 반환할 수 없거나, contract가 string을 사용하고 있어 다른 contract를 호출 할 수 없는 때
    //다음과 같이 변환 과정이 필요하게 됨
    function stringToBytes32(
        string memory input
    ) public view returns (bytes32) {
        bytes32 changer = bytes32(abi.encodePacked(input));
        return changer;
    }

    function bytes32ToString(
        bytes32 input
    ) public view returns (string memory) {
        string memory changer = string(abi.encodePacked(input));
        return changer;
    }
}
