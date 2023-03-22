# ScolCoin Chain Documentation

Welcome to the ScolCoin Chain documentation site!

Please note that both the ScolCoin Chain software and this documentation site will improve over time and is still a work-in-progress.<br/>
Be sure to engage with our community channels to stay updated.

Have fun trading and see you on chain!

## What is ScolCoin Chain?

ScolCoin Chain is an innovative solution to bring programmability and interoperability to ScolCoin Chain. ScolCoin Chain relies on a system of PoA consensus that can support short block time and lower fees. The most bonded validator candidates of staking will become validators and produce blocks. The double-sign detection and other slashing logic guarantee security, stability, and chain finality.

Please read the [FAQ](./faq/nc/general.md) to get started.


## What can I do with ScolCoin Chain?

The purpose of the new blockchain and DEX is to create an alternative marketplace for issuing and exchanging digital assets in a decentralized manner.

You can:

- Send and receive SCOL
- Issue new tokens to digitalize assets, and use ScolCoin Chain as underlying exchange/transfer
network for the assets



**For developers**, you can also:

ScolCoin Chain, SCOL boasts smart contract functionality and compatibility with the Ethereum Virtual Machine (EVM). The design goal here was to leave the high throughput of ScolCoin Chain intact while introducing smart contracts into its ecosystem.

Because SCOL is EVM-compatible, it launched with support for the rich universe of Ethereum tools and DApps. In theory, this makes it easy for developers to port their projects over from Ethereum. For users, it means that applications like [MetaMask](smart-chain/wallet/metamask.md) can be easily configured to work with TC. Seriously – it’s just a matter of tweaking a couple of settings. Check out Use MetaMask for ScolCoin Chain to get started.

You can:

- Send and receive SCOL
- Explore the transaction history and blocks on the chain, via [SCOL SCAN](https://explorer.scolcoin.com/), API
and node RPC interfaces.

**Developers** can also:

- [Issue](./smart-chain/developer/issue-SRC20.md) new tokens to digitalize assets
- Run a [full node](./smart-chain/developer/fullnode.md) to listen to and broadcast live updates on transactions, blocks, and consensus activities
- [Develop wallets](./smart-chain/wallet/wallet_api.md) and tools to help users use Dapps

## Get Started

Want to try it **ScolCoin Chain**? Just give a peek at the first few of pages of the [getting started guide](get-started.md).<br/>
You could also have a read through the [FAQ](faq/faq.md).

Want to develop on **ScolCoin Chain**? First, read through the [FAQ](faq/nc/general.md) and learn about tokens [here](smart-chain/developer/SRC20.md).

## Asset Management

### SRC20 Asset

A token protocol on SCOL which is compatible with [ERC20](https://eips.ethereum.org/EIPS/eip-20). It extends ERC20 and contains more interfaces, such as `getOwner` and `decimals`. Read the full proposal here: <https://github.com/scolcoin/ERC20>

- [Issue SRC20](smart-chain/developer/issue-SRC20.md)
- [Wallet](smart-chain/wallet.md)

## SCOL (and Other Coins) MainNet Switch

ScolCoin (SCOL) was an ERC20 token on the Ethereum network.<br/>
After the launch of ScolCoin Chain, ScolCoin (SCOL) is being converted into native SCOL tokens on the main network via the exchange platform at [scolcoin.com](https://www.scolcoin.com), a pragmatic and efficient way to perform the initial token swap.

ScolCoin Chain is ready for other projects to migrate their tokens to take advantage of performant transactions with more liquidity options and native marketplace features.<br/>
More information about how projects can set themselves up for this (via [scolcoin.com](https://www.scolcoin.com) or partners) will come soon.


## Technology Details
Continue reading below if you are interested in what is happening under the hood!

- [ScolCoin Chain as a Block Chain](blockchain.md): about consensus, software stack, network layout and roles.
- [Run a ScolCoin Chain full node](smart-chain/developer/fullnode.md): how to run a full node and become part of the p2p network of ScolCoin Chain.


## Acknowledgement
Thanks to the [community, our partners and supporters](acknowledgement.md).
