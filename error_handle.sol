//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract error {


    address public owner;
    uint public count;
    
    constructor(){
        owner=msg.sender;
    }

    function call() public {
        count++;
        require(msg.sender == owner, "Only owner should be the function caller");
    }
// custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }


    uint num;
    function testAssert() public view {
    assert(num >= 0);
    } 
   
}
