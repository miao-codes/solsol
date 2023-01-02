// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Edu1 { 
   function sum(uint256 _a, uint256 _b)external returns(uint256 ){
       return _a + _b;
   }

   function calculate() public returns(uint256){
       uint256 a=10;
       uint256 b=20;
       uint256 result = this.sum(a, b);
       return result;
   }
}






// import "@openzeppelin/contracts/ownership/Ownable.sol";
//    string public name = "edu";
//    string private name_private="edu_private";
//    string internal name_internal="edu_internal";


//       enum CallClass {
//        Public,
//        Private,
//        Internal,
//        External
//    }
//    function callname(CallClass _callClass)public returns(string){
//        if(_callClass==CallClass(0)){
//            return name;
//        }
//        if(_callClass==CallClass(1)){
//            return name_private;
//        }

//             if(_callClass==CallClass(2)){
//            return name_internal;
//        }
//     //    if(_callClass==CallClass(3)){
//     //        return name_external;
//     //    }

//    }


//       function callname_private(CallClass _callClass)private returns(string){
//        if(_callClass==CallClass(0)){
//            return name;
//        }
//        if(_callClass==CallClass(1)){
//            return name_private;
//        }

//             if(_callClass==CallClass(2)){
//            return name_internal;
//        }
//     //    if(_callClass==CallClass(3)){
//     //        return name_external;
//     //    }

//    }

//         function callname_internal(CallClass _callClass)internal returns(string){
//        if(_callClass==CallClass(0)){
//            return name;
//        }
//        if(_callClass==CallClass(1)){
//            return name_private;
//        }

//             if(_callClass==CallClass(2)){
//            return name_internal;
//        }
//     //    if(_callClass==CallClass(3)){
//     //        return name_external;
//     //    }

//    }

//     function callname_external(CallClass _callClass)external returns(string){
//        if(_callClass==CallClass(0)){
//            return name;
//        }
//        if(_callClass==CallClass(1)){
//            return name_private;
//        }

//             if(_callClass==CallClass(2)){
//            return name_internal;
//        }
//     //    if(_callClass==CallClass(3)){
//     //        return name_external;
//     //    }

//    }

