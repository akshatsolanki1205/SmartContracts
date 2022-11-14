//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";


contract tekken {
    string public name = "hardhat token";
    string public symbol = "hht";
    uint public total = 10000;

    address public owner;

    mapping(address=>uint) balances; 

    constructor() {
        balances[msg.sender] = total;
        owner = msg.sender;
    }

    function transfer(address _to, uint amount) external payable {
        console.log("msg.sender balance:" , balances[msg.sender]);
        console.log("owner is sending " , amount, " to " , _to); 
        require(balances[msg.sender] >= amount, " not enough tokens ");
        
        balances[_to] += amount;
        balances[msg.sender] -= amount;
    }


    function Checkbalance(address account) external view returns(uint) {
        return balances[account];
    }

}