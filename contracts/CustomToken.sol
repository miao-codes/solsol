// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//erc20 표준 사용 없이 토큰 만들기
contract CustomToken {
    //컨트랙트 발행주소 = 주인
    address public owner;

    //토큰 이름
    string public name;
    //토큰 심볼
    string public symbol;

    //잔액
    mapping(address => uint256) public balances;

    //총 발행량
    uint256 public totalSupply;

    /*
    생성자 = constructor
    객체 초기화 코드
    다른 객체 지향 언어는 객체를 무한정 만들 수 있으나 (예:  붕어빵2 = new 붕어빵())
    블록체인 계약서는 단 한번 만들기 때문에 초기 한번만 사용하게 됨.
    */
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = symbol;
        owner = msg.sender;
        mint(msg.sender, _totalSupply);
    }

    /*
   [mint : 토큰 발행하기]
   address(0) 은 0x0000000.....00  을 리턴
   쉽게 주소가 공백인지 여부를 체크하는 것
   account : 새로 발행한 토큰을 받을 주소
   amount :  발행할 양
   */
    function mint(address account, uint256 amount) public {
        require(account != address(0), "mint to the zero address");
        require(account == owner, "only owner");
        totalSupply += amount;
        balances[owner] += amount;
    }

    /*
   [transfer : 토큰 전송하기]
   from : 발신 주소
   to: 수신 주소   
   amount:  전송할 토큰 양
   */
    function transfer(
        address from,
        address to,
        uint256 amount
    ) public {
        require(from != address(0), "transfer from the zero address");
        require(to != address(0), "transfer to the zero address");

        uint256 fromBalance = balances[from];
        require(fromBalance >= amount, "transfer amount exceeds balance");
        //require(balances[to]+amount > balances[to]);
        balances[from] = fromBalance - amount;
        balances[to] += amount;
    }

    /*
   [burn : 토큰 소각하기]
   account : 잔액를 줄일 주소  (only owner 일 경우 owner 주소 입력)
   amount :  소각할 양
   */
    function burn(address account, uint256 amount) public {
        require(account != address(0), "burn from the zero address");
        require(account == owner, "only owner");
        uint256 accountBalance = balances[account];
        require(accountBalance >= amount, "burn amount exceeds balance");
        balances[account] = accountBalance - amount;
        totalSupply -= amount;
    }
}
