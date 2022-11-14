//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";
contract VendingMachine {

    address public owner;
    mapping(address=>uint) donutBalance;

    constructor () {
        owner = msg.sender;
        donutBalance[address(this)] = 100;

        
    }

    function getVendingMachineBalance() public view returns(uint) {
        return donutBalance[address(this)];
    }
    
    function restock (uint amount) public {
        require(msg.sender == owner , "Invalid access");
        donutBalance[address(this)] +=amount;
    }

    function purchase (uint amount) public payable {
        require( msg.value > amount * 2 ether , "donuts costs 2 ether per piece");
        require(donutBalance[address(this)]>amount, 'not enough donuts');

        donutBalance[address(this)] -= amount;
        donutBalance[msg.sender] += amount; 
    }

     
}