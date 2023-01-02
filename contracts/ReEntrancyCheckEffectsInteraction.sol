// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Company {
    mapping(address => uint) public shares;
    mapping(address => bool) public reenterChecks;

    constructor() payable {}

    modifier CheckEffects() {
        require(reenterChecks[msg.sender] == false);
        reenterChecks[msg.sender] = true;
        _;
        reenterChecks[msg.sender] = false;
    }

    function buyShare() external payable {
        shares[msg.sender] += msg.value;
    }

    function sellShareAll() external CheckEffects {
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
