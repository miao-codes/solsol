// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Payable {
    address payable sender;

    constructor() payable {
        sender = payable(msg.sender); //sender==owner
    }

    function sendEther1(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }

    function sendEther2(address _to, uint _amount) public {
        payable(_to).transfer(_amount);
    }

    function sendEther3(uint _amount) public {
        //error
        //msg.sender.transfer(_amount);
        payable(msg.sender).transfer(_amount);
    }
}

contract Payable2 {
    address payable sender;
    uint amount;

    //error
    // constructor() {
    //     amount = msg.value;
    // }

    constructor() payable {
        amount = msg.value;
    }

    function sendEther1(address payable _sender, uint _amount) public {
        sender = _sender;
        sender.transfer(_amount);
    }

    function sendEther2(address _sender, uint _amount) public {
        sender = payable(_sender);
        sender.transfer(_amount);
    }

    function sendEther3(uint _amount) public {
        //error
        //msg.sender.transfer(_amount);
        payable(msg.sender).transfer(_amount);
    }
}

contract PayableExample {
    // Payable address can receive Ether
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated.
    function deposit() public payable {}

    // Call this function along with some Ether.
    // The function will throw an error since this function is not payable.
    function notPayable() public {}

    // Function to withdraw all Ether from this contract.
    function withdraw() public {
        // get the amount of Ether stored in this contract
        uint amount = address(this).balance;

        // send all Ether to owner
        // Owner can receive Ether since the address of owner is payable
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        // Note that "to" is declared as payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    event SendViaCallLog(address to, uint value, bytes data);

    constructor() payable {}

    //from msg.sender address to _to address
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    //from contract address to _to address
    function sendViaTransfer2(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(
        address payable _to
    ) public payable returns (bytes memory) {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        //call set gas
        //(bool sent, bytes memory data) = _to.call{value: msg.value, gas: 100000}("");

        require(sent, "Failed to send Ether");
        emit SendViaCallLog(_to, msg.value, data);
        return data;
    }
}

// contract PayableExample {
//     //payable 한 주소는 이더를 받을 수 있음
//     address payable public owner;
//     //payable 생성자는 이더를 받을 수 있음
//     constructor() payable {
//         owner = payable(msg.sender);
//     }

//      // 이 컨트랙트에 Ether를 입금하는 함수.
//      // Ether와 함께 이 함수를 호출합니다.
//      // 이 컨트랙트의 잔액은 자동으로 업데이트됩니다.

//     function deposit() public payable {}

//     // Ether와 함께 이 함수를 호출합니다.
//     // 이 함수는 payable키워드가 없기 때문에 지불할 수 없어 함수에서 오류가 발생합니다.
//     function notPayable() public {}

//     // 이 컨트랙트에서 모든 이더를 인출하는 기능.
//     function withdraw() public {
//         //이 컨트랙트에 저장된 이더양 가져오기
//         uint amount = address(this).balance;
//         // 이더를 owner 에게 전송
//         // Owner의 주소는 payable 하기 때문에 이더를 받을 수 있음
//         (bool success, ) = owner.call{value: amount}("");
//         require(success, "Failed to send Ether");
//     }

//     // 컨트랙트에 예치된 금액 중 _amount만큼 _to 주소로 이더 전송하는 함수
//     function transfer(address payable _to, uint _amount) public {
//         // Note that "to" is declared as payable
//         (bool success, ) = _to.call{value: _amount}("");
//         require(success, "Failed to send Ether");
//     }

//    // 컨트랙트 이더잔액 조회하는 함수
//     function getBalance() public view returns(uint){
//         return address(this).balance;
//     }
// }
