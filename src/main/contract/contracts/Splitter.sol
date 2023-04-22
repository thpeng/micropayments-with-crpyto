pragma solidity ^0.8.15;

contract Splitter {

    address payable public techProvider = '0x189Bf5d9a18DF7c24DD1794ebF09A7e33DfeB290';
    address payable public contentProvider;
    event TransferReceived(address _from, uint _amount);

    constructor(address payable memory _addrs){
        contentProvider = _addrs;
    }

    receive() payable external {
        uint256 techShare = msg.value / 10 ;
        uint256 contentShare = msg.value / 10 * 9;

        techProvider.transfer(techShare);
        contentProvider.transfer(contentShare);

        emit TransferReceived(msg.sender, msg.value);
    }
}