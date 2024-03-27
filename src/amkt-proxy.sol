// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {TransparentUpgradeableProxy, ITransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract amktProxy is TransparentUpgradeableProxy {
    // Errors //
    error CannotUpgradeToZeroAddress();

    // Events //
    event ReceivedEthers(uint256 indexed value, address indexed sender);

    constructor(
        address _implementationContract
    ) TransparentUpgradeableProxy(_implementationContract, msg.sender, "") {}

    receive() external payable {
        emit ReceivedEthers(msg.value, msg.sender);
    }
}
