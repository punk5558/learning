pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addressed allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of maxWhitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // Note: Don't change this variable name, as it will be part of verification
    uint8 public numAddressesWhitelisted;

    // Setting the max number of whitelisted addresses
    // User will input the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
      maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // addAddresstoWhitelist - This function adds the address of the sender to the whitelist

    function addAddresstoWhitelist() public {
      // check if the user has been whitelisted
      require(!whitelistedAddresses[msg.sender], "sender has been whitelisted");

      // check if we can still add to the whitelist
      require(numAddressesWhitelisted < maxWhitelistedAddresses, "the whitelist is full");

      // add the user to the mapping of whitelisted addresses
      whitelistedAddresses[msg.sender] = true;

      // increase the number of whitelisted address by 1
      numAddressesWhitelisted += 1;
    }


}
