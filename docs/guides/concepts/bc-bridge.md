# BC <-> SCOL Token Bridge

!!! Note
	Please note that *BC <-> SCOL Token Bridge* is a module of ScolCoin Chain fullnode to facilitate cross-chain transfer between ScolCoin Chain and ScolCoin Chain, while  [SCOL Bridge](https://www.scolcoin.com/en/bridge), a bridge service providing access to inter-blockchain liquidity for ScolCoin Chain, ScolCoin Chain decentralized applications, and bring valuable assets to ScolCoin Chain ecosystems.

## What is BC <-> SCOL  bridge

BC <-> SCOL token bridge for self transfers of BEP2 tokens to SRC20 (ERC20 representation). The BC <-> SCOL  bridge connects two chains (BC and TC). When a user deposits BEP2 into the BC <-> SCOL bridge contract contract on BC they get the same amount of SRC20 tokens on TC, and they can convert them back as well.

A purely-code-controlled escrow account is a kind of account which is derived from a hard-coded string in shree chain protocol. This kind of account doesn't have its own private key and it's only controlled by code in protocol. The code for calculating escrow account is the same as how it's done in [cosmos-sdk](https://github.com/cosmos/cosmos-sdk/blob/82a2c5d6d86ffd761f0162b93f0aaa57b7f66fe7/x/supply/internal/types/account.go#L40):
```
AtomicSwapCoinsAccAddr = sdk.AccAddress(crypto.AddressHash([]byte("ScolCoin ChainPegAccount")))
```
The account for mainnet is: **scol1v8vkkymvhe2sf7gd2092ujc6hweta38xadu2pj** and the account for testnet is: **tscol1v8vkkymvhe2sf7gd2092ujc6hweta38xnc4wpr**. Once the swap is claimed or refunded, the fund will be transferred from the purely-code-controlled escrow account to client accounts.


## Fee Table

Transaction Type  | Pay in SCOL |
-- | -- |
BC <-> SCOL Bridge Bind | 0.01 |
Transfer Out| 0.01 |
BC <-> SCOL Bridge Bind Relayer Fee| 0.01 |
Transfer Out Relayer Fee| 0.01 |


## Commands

### Download

Please download `eth-cli` binary from [here](https://github.com/githubusername/githubrepo/node/releases/tag/v0.8.1)

### Bind

#### Parameters for BC <-> SCOL  bridge bind

| **parameter name**  | **example**                                | **comments**                                         | **required** |
| ------------------- | ------------------------------------------ | ---------------------------------------------------- | ------------ |
| --chan-id           | SCOL-Chain-XXX                          | the chain id of shree  chain                       | Yes          |
| --from              | alice                                      | account name                                         | Yes          |
| --symbol            | DEF-0E9                                    | chain-id of the side  chain the validator belongs to | Yes          |
| --amount            | 1000000000                                 | amount of tokens to bind                             | Yes          |
| --contract-address  | 0x6aade9709155a8386c63c1d2e5939525b960b4e7 | contract address of token  in smart chain            | Yes          |
| --contract-decimals | 18                                         | decimals of token in  smart chain                    | Yes          |
| --expire-time       | 1594715271                                 | timestamp of bind expire  time                       | Yes          |

#### For example

* Mainnet
```bash
eth-cli bridge bind --symbol DEF-0F9 --amount 6000000000000000 --expire-time 1594715271 --contract-decimals 18 --from alice --chain-id SCOL-Chain-Tigris --contract-address 0x6aade9709155a8386c63c1d2e5939525b960b4e7 --home ~/home_cli
```

###  Unbind

#### Parameters for BC <-> SCOL  bridge unbind

| **parameter name** | **example**                                | **comments**                                         | **required** |
| ------------------ | ------------------------------------------ | ---------------------------------------------------- | ------------ |
| --chan-id          | SCOL-Chain-XXX                          | the chain id of shree  chain                       | Yes          |
| --from             | alice                                      | account name                                         | Yes          |
| --symbol           | DEF-0E9                                    | chain-id of the side  chain the validator belongs to | Yes          |

#### For example

* Mainnet
```bash
eth-cli bridge unbind --symbol DEF-0F9 --from alice --chain-id SCOL-Chain-Tigris --home ~/home_cli
```

### Transfer out

#### Parameters for BC <-> SCOL bridge transfer-out

| **parameter name** | **example**                                | **comments**                           | **required** |
| ------------------ | ------------------------------------------ | -------------------------------------- | ------------ |
| --chan-id          | SCOL-Chain-XXX                          | the chain id of shree  chain         | Yes          |
| --from             | alice                                      | account name                           | Yes          |
| --to               | 0xf9f609f9f4309f191654aa1fd691a6be6aefa7ac | receiver address in smart  chain       | Yes          |
| --amount           | 1000000000:SCOL  (10 SCOL)                   | amount of token to  transfer           | Yes          |
| --expire-time      | 1594715271                                 | timestamp of transfer out  expire time | Yes          |

#### For example

* Mainnet
```bash
eth-cli bridge transfer-out --to 0xf9f609f9f4309f191654aa1fd691a6be6aefa7ac --expire-time 1594715271 --chain-id SCOL-Chain-Tigris --from alice --amount 100000000:DEF-0F9 --home ~/home_cli
```
