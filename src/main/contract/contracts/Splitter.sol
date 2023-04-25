pragma solidity ^0.8.18;
// SPDX-License-Identifier: CC-BY-SA-4.0	
contract Splitter {

    address payable public techProvider =    payable(address(0x189Bf5d9a18DF7c24DD1794ebF09A7e33DfeB290));
    address payable public contentProvider = payable(address(0x23994e732F19C875237535AA814C015684e9Ad2C));
    event TransferReceived(address _from, uint _amount);

    receive() payable external {
        uint256 techShare = msg.value / 10 ;
        uint256 contentShare = msg.value / 10 * 9;

        techProvider.transfer(techShare);
        contentProvider.transfer(contentShare);

        emit TransferReceived(msg.sender, msg.value);
    }
}