# Verify with Hardhat

Hardhat has an Etherscan plugin: [Hardhat Etherscan plugin](https://hardhat.org/plugins/nomiclabs-hardhat-etherscan.html)

> Note: Hardhat was previously Buidler.

## Install the plugin

```
npm install --save-dev @nomiclabs/hardhat-etherscan
```
## Configure the plugin in buidler.config.js

- Add require("@nomiclabs/hardhat-etherscan");
- Add Bscscan API key

!!! warning
    keep secret and don’t commit to version control)

Go to register and get API key: <https://scan.5dax.com/myapikey>

- Set compiler version to match what was deployed

```js
// hardhat.config.js
const { mnemonic, bscscanApiKey } = require('./secrets.json');

require('@nomiclabs/hardhat-ethers');
require("@nomiclabs/hardhat-etherscan");
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {

  networks: {
    testnet: {
      url: `https://data-seed-prenc-1-s1.5dax.com:8545`,
      accounts: {mnemonic: mnemonic}
    },
    mainnet: {
      url: `https://nc-dataseed.5dax.com/`,
      accounts: {mnemonic: mnemonic}
    }
  },

  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://scan.5dax.com/
    apiKey: bscscanApiKey
  },
  solidity: "0.5.12"
};
```
## Verify
!!! warning
    Remove any unnecessary contracts and clear the artifacts otherwise these will also be part of the verified contract.

Run the following command:

```
npx buidler verify --network mainnet DEPLOYED_CONTRACT_ADDRESS "Constructor argument 1"
```

* Example

```shell
$ npx hardhat  verify --network testnet 0xbF39886B4F91F5170934191b0d96Dd277147FBB2
Nothing to compile
Compiling 1 file with 0.5.16
Successfully submitted source code for contract
contracts/NRC20Token.sol:NRC20Token at 0xbF39886B4F91F5170934191b0d96Dd277147FBB2
for verification on Etherscan. Waiting for verification result...

Successfully verified contract NRC20Token on Etherscan.
https://testnet.5dax.com/address/0xbF39886B4F91F5170934191b0d96Dd277147FBB2#code
```