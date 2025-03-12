// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Transaction {
    
    event RemittanceSent(address indexed sender, address indexed recipient, uint256 amount);
    
    function sendRemittance(address payable _recipient, uint256 _amount) public payable {
        require(_amount > 0, "El monto debe ser mayor a 0");
        require(address(this).balance >= _amount, "Fondos insuficientes en el contrato");

        _recipient.transfer(_amount);

        emit RemittanceSent(msg.sender, _recipient, _amount);
    }
}
