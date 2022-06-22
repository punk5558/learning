const { ethers } = require("hardhat");

async function main() {

  /*
  A contractfactory in ethers.js is an abstraction used to deploy new smart contracts.
  whitelistContract here is a factory for instances of our whitelist contract.
  */
  const whitelistContract  = await ethers.getContractFactory("Whitelist");

  // deploy the contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  // 10 is the max numbr of whitelisted addresses allowed

  // wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  // print the address of the deployed contract
  console.log("Whitelist Contract Address", deployedWhitelistContract.address);

}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
