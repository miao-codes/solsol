// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Call {
    event FallbackCalled(string _msg);
    event ReceiveCalled(string _msg);
    
    receive() external payable {
        emit ReceiveCalled("Receive Func called");
    }
    // fallback() external {
    //     emit FallbackCalled("Fallback Func called");
    // }

    // 이더가함께 전송된 함수가 호출되었는데 없는 함수일경우, fallback에 payable이 있어야 한다. 
    fallback() external payable {
                emit FallbackCalled("Fallback Func called");
    }
    function add(uint256 _a, uint256 _b) public pure returns(uint256){
        return _a + _b;
    }
}


contract Caller {
  event AddResult(bool _success, bytes _result);
    //1. 송금
    function transferMoney(address payable _to) public payable returns(bool) {
        //두개의 결과값 리턴하지만, 여기서는 두번째에 해당하는 리턴값이 따로 없으므로 공란 
        (bool success,)= _to.call{value:msg.value}("");
        require(success, "failed to transfer money");
        return success;
    }
    //외부 컨트랙트 호출
    function callExternalMethod(address _contractAddress, uint256 _a, uint256 _b) public returns(bytes memory){
        //두개의 결과값 리턴 , 두번째 값은 리턴된 값으로 bytes화 되어 리턴된다.
        (bool success, bytes memory result)= _contractAddress.call(abi.encodeWithSignature("add(uint256,uint256)", _a, _b));
        require(success, "failed to add nums");
        emit AddResult(success, result);
        return result;
    }

    function callFallbackMethod(address _contractAddress) public payable{
         (bool success, bytes memory result)= _contractAddress.call{value:msg.value}(abi.encodeWithSignature("sum()"));
       emit AddResult(success, result);
    }
}
