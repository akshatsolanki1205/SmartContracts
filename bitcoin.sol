//SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import 'hardhat/console.sol';

contract bitcoin {

    string public name = "bitcoin";
    string public symbol = 'B';
    uint public totalB = 10000;
    address public owner;

    mapping (address => uint) balances;   // store the balance of accounts;

    constructor () {
        owner = msg.sender;
        balances[msg.sender] = totalB;
    }

    //lets transfer bitcoins;

    function send(address _to, uint amount) external {
        console.log("this function is running fine");
        require(balances[owner] >= amount , "not enough bitcoins");

        balances[owner] -= amount;
        balances[_to] = amount;


    }


    //let's check balance;

    function checkbalance(address account) external view returns(uint) {

        return balances[account];

    }

}