// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract IntExample {
    int num1;
    //uint num1=-1; (x)
    uint public num2 = 1;
    //int8 num3=128;(x)
    int8 public num3 = 127;

    //---------[MIN-MAX] -------------------
    ///Int8 — [-128 : 127]
    // Int16 — [-32768 : 32767]
    // Int32 — [-2147483648 : 2147483647]
    // Int64 — [-9223372036854775808 : 9223372036854775807]
    // Int128 — [-170141183460469231731687303715884105728 : 170141183460469231731687303715884105727]
    // Int256 — [-57896044618658097711785492504343953926634992332820282019728792003956564819968 : 57896044618658097711785492504343953926634992332820282019728792003956564819967]

    // UInt8 — [0 : 255]
    // UInt16 — [0 : 65535]
    // UInt32 — [0 : 4294967295]
    // UInt64 — [0 : 18446744073709551615]
    // UInt128 — [0 : 340282366920938463463374607431768211455]
    // UInt256 — [0 : 115792089237316195423570985008687907853269984665640564039457584007913129639935]

    uint256 public MAX_UINT1 =
        115792089237316195423570985008687907853269984665640564039457584007913129639935;
    //uint256 MAX_INT1 = 115792089237316195423570985008687907853269984665640564039457584007913129639936;(x);
    uint256 public MAX_UINT2 =
        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff; // = 1.157920892373162e+77

    // uint256 MAX_INT4 = uint256(-1); (x);
    uint256 public MAX_UINT3 = 2 ** 256 - 1;

    int MAX_INT = type(int256).max; //57896044618658097711785492504343953926634992332820282019728792003956564819967
    int MIN_INT = type(int256).min; //-57896044618658097711785492504343953926634992332820282019728792003956564819968
    uint MAX_UINT = type(uint256).max;
    uint MIN_UINT = type(uint256).min;

    function getMaxInt() public view returns (int) {
        return MAX_INT;
    }

    function getMinInt() public view returns (int) {
        return MIN_INT;
    }

    function getMaxUInt() public view returns (uint) {
        return MAX_UINT;
    }

    function getMinUInt() public view returns (uint) {
        return MIN_UINT;
    }
}
