// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract BytesExample {
    //byte는 bytes1 과 같은 표현이며 1개의 byte를 가진 array입니다.
    //고정바이트배열 : bytes32 와 같이 bytesN 형태를 사용할 수 있는데 1에서 32까지 가능. 컨트랙트간 이동이 가능하려면 고정바이트배열 사용하기
    //동적(가변)바이트배열: 숫자 없이 'bytes' 로 사용하며 byte[] 로 볼 수 있어 솔리디티의 배열 멤버인 push,pop, length 사용 가능
    //고정 바이트가 동적 바이트 대비 가스비 소모 적음

    bytes single = "0x1";
    bytes a = "hello ";
    bytes32 b = "this is bytes32";
    bytes32 d = "Lorem Ipsum is simply dummy text";
    bytes e =
        "Lorem Ipsum is simply dummy text of the printing and typesetting";
    string c =
        "Lorem Ipsum is simply dummy text of the printing and typesetting";
    bytes addr = "0xA0c68C638235ee32657e8f720a23ceC1bFc77C77";

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
