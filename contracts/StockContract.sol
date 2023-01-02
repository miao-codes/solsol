// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract StockContract {
    //매핑
    mapping(address => Stock[]) portfolios;

    //구조체
    struct Stock {
        string name; //회사이름
        string symbol; //회사심볼
        uint marketCap; //시가총액
        uint shares; //주식수
        uint price; //현재가
        string sector; //업종
        string homepage; //홈페이지주소
    }

    Stock[] stocks; //storage저장

    //stock 정보 저장
    function setStockInfo(
        string calldata _name,
        string calldata _symbol,
        uint _shares,
        uint _price,
        string calldata _sector,
        string calldata _homepage
    ) public returns (Stock memory) {
        // 모든 지역변수 기본값은 storage
        Stock memory newstock = Stock(
            _name,
            _symbol,
            _shares * _price,
            _shares,
            _price,
            _sector,
            _homepage
        );
        stocks.push(newstock);
        return newstock;
    }

    //stock정보 조회
    function getStockInfo(uint _index) public view returns (Stock memory) {
        return stocks[_index];
    }

    function changeStockPrice(uint _index, uint _price)
        public
        returns (Stock memory)
    {
        stocks[_index].price = _price;
        stocks[_index].marketCap = _price * stocks[_index].shares;
        return stocks[_index];
    }

    function changeStockShares(uint _index, uint _shares)
        public
        returns (Stock memory)
    {
        Stock memory currentStock = stocks[_index];
        currentStock.shares = _shares;
        currentStock.marketCap = _shares * currentStock.price;
        stocks[_index] = currentStock;
        return currentStock;
    }

    //내 포트폴리오에 종목 더하기
    function addMyStock(address _myAddress, uint _stockIndex) public {
        Stock memory stock = stocks[_stockIndex];
        portfolios[_myAddress].push(stock);
    }

    //내 포트폴리오 확인하기
    function checkMyPortfolio(address _myAddress)
        public
        view
        returns (Stock[] memory)
    {
        return portfolios[_myAddress];
    }

    function makeImsiStockList() public {
        Stock memory samsung = Stock(
            "samsung",
            "005930",
            5969782550 * 60400,
            5969782550,
            60400,
            "manufacturer",
            "https://samsung.com/"
        );
        stocks.push(samsung);
    }

    //다차원 배열이 가능한 솔리디티
    //1차원 배열
    address[] members;
    uint256[] numbers = [1, 2, 3, 4, 5];
    uint256[6] fixedNumbers = [1, 3, 5];
    string[] word = ["h", "e", "l", "l", "o"];
    string[2] fixedWord = ["h", "i"];
    bytes32 thisIsArray = "this is similar to byte[]";

    //2차원 배열
    uint[2][] matrix1 = [[1, 3], [5, 6], [5, 7]];
    uint[][2] matrix2 = [[10, 20, 30], [50, 60, 70]];

    //3차원 배열
    uint[][][2] matrix3;

    //new 이용해 배열 선언
    string[] words = new string[](2);

    function makeArray(uint _length) external pure returns (uint[] memory) {
        //메모리 키워드 사용시
        uint[] memory memoryValues = new uint[](_length);
        for (uint i = 0; i < _length; i++) {
            memoryValues[i] = i;
        }
        return memoryValues;
    }

    function stringArray() external {
        words.push("hello");
        words.push("world");
    }

    enum ActionChoices {
        GoLeft,
        GoRight,
        GoStright,
        SitStil
    }

    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStright;

    function sum(uint256 _a, uint256 _b) external returns (uint256) {
        return _a + _b;
    }

    function calculate() public returns (uint256) {
        uint256 a = 10;
        uint256 b = 20;
        uint256 result = this.sum(a, b);
        return result;
    }
}
