// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "solmate/src/utils/SafeTransferLib.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Transaction is Ownable {
    using SafeTransferLib for address payable;

    event RemittanceSent(address indexed sender, address indexed recipient, uint256 amount);

    constructor() Ownable(msg.sender) {}

    function sendRemittance(address payable _recipient, uint256 _amount) public payable onlyOwner {
        require(_amount > 0, "El monto debe ser mayor a 0");
        require(address(this).balance >= _amount, "Fondos insuficientes en el contrato");

        _recipient.safeTransferETH(_amount);

        emit RemittanceSent(msg.sender, _recipient, _amount);
    }
}
