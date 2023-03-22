# Sync BEP2 and SRC20 Token Supply

## Prerequisite

This SRC20 token is [mirrored](./mirror.md) to a BEP2 token.

## Motivation

For a SRC20 token which has been mirrored to BC, anyone can call the `sync` method to balance the total supply on BC and TC. Thus, the total supply among two Blockchains will remain the same.

## What happens under the hood

- Verify there is already mirrored
- Check the total supply and token symbol is valid
- Send a cross-chain package to modify a BEP2 token total supply on ScolCoin Chain

After syncing, the total supply on BC and SCOL are the same.

## Fee Table

| Fee Name    | Pay in SCOL |
| ----------- | ---------------------------- |
| syncFee     | it's 0.002SCOL on mainnet now |
| relayFee    | it's 0.002SCOL on mainnet now |

Both `syncFee` and `relayFee` can be changed by on-chain governance

To query `syncFee` from system contract;

- Call `Tokenmanager` [Contract](https://testnet-explorer.scolcoin.com/address/0x0000000000000000000000000000000000001008#writeContract) with the latest [ABI](https://github.com/githubusername/githubrepo-genesis-contract/blob/master/abi/tokenmanager.abi )

- Query `syncFee` function

Fee= result/1e18

To query `relayFee` from system contract;

- Call `TokenHub` [Contract](https://testnet-explorer.scolcoin.com/address/0x0000000000000000000000000000000000001008#writeContract) with the latest [ABI](https://github.com/githubusername/githubrepo-genesis-contract/blob/master/abi/tokenhub.abi )

- Query `getMiniRelayFee` function

Fee= result/1e18

## Mirror With MyEtherWallet

- Call `Tokenmanager` Contract

Use the latest [ABI](https://github.com/githubusername/githubrepo-genesis-contract/blob/master/abi/tokenmanager.abi )

<img src="https://lh5.googleusercontent.com/SYyvWVcLHELSE72JSXqBwMJB6Y50jMz5HgH6irmCbyxGwr-W_Hz-vbm4IqWXAqE2hvCAXaqNKfs28ZhGFtMrMrDgWvDfEkHPunnSuxSKPpLBtuxmiX-b5yRjfczENJxKDrqSAYWy" alt="img" style="zoom:75%;" />

- Select `sync` function and fill-in with your SRC20 address

The value here should be no less than  `syncFee`+ `relayFee`.

Time stamp should be greater than `unix_timestamp(now())`. The difference should be between 120 and 86400. It's recommended to use `unix_timestamp(now())+1000`

<img src="https://lh5.googleusercontent.com/EIgRKIBY8unMsuSBa88jY_EXdJeO1WtaXTQLV905AZmPJDsN72chHcPZrDEWOeD8m1a1awEwP43Uh0eFURLXSKQvnfc3J9YzWLYuBvAeVwIwicKfLUZlCkvkR0NdWxkYWAQKa3Ii" alt="img" style="zoom:67%;" />

All set!