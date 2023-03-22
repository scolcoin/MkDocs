# Cross-Chain Transfer

Cross-chain transfers only support bound BEP2 or BEP8 tokens on BC and SRC20 tokens on TC.

## Verify Token Info

First, you should make sure that it's already bound. For example, you could see the binding info of **SCOL**:


```shell
## mainnet
eth-cli token info --symbol SCOL --trust-node --node http://dataseed4.scolcoin.com:80

## testnet
eth-cli token info --symbol SCOL --trust-node --node http://data-seed-pre-0-s3.scolcoin.com:80 
```

```json
{
  "type": "scolchain/Token",
  "value": {
    "name": "ScolCoin Chain Native Token",
    "symbol": "SCOL",
    "original_symbol": "SCOL",
    "total_supply": "200000000.00000000",
    "owner": "tscol1l9ffdr8e2pk7h4agvhwcslh2urwpuhqm2u82hy",
    "mintable": false,
    "contract_address": "0x0000000000000000000000000000000000000000",
    "contract_decimals": 18
  }
}
```

As SCOL is the native token on both chains, so we use `0x0000000000000000000000000000000000000000` as the corresponding contract address. Besides, on TC, the native token decimals is 18, while the decimals on BC is 8. So if you transfer 1e8:SCOL to TC, the recipient balance will gain 1e18.


## Transfer SCOL from BC to TC

**Example:**

```shell
## mainnet
eth-cli bridge transfer-out --to 0xEe9546E92e6876EdF6a234eFFbD72d75360d91f0 --expire-time 1597543193 --chain-id SCOL-Chain-Tigris --from owner --amount 100000000:SCOL --node http://dataseed4.scolcoin.com:80

## testnet
eth-cli bridge transfer-out --to 0xEe9546E92e6876EdF6a234eFFbD72d75360d91f0 --expire-time 1597543193 --chain-id SCOL-Chain-Ganges --from owner --amount 100000000:SCOL --node http://data-seed-pre-0-s3.scolcoin.com:80
```

Result:

```bash
Committed at block 465899 (tx hash: 68FFF82197E27A3EC14AFF8C99A035FA9CA7120312AA55E98D11DFC0F8D9F3B9, response: {Code:0 Data:[] Log:Msg 0:  Info: GasWanted:0 GasUsed:0 Events:[{Type: Attributes:[{Key:[84 114 97 110 115 102 101 114 79 117 116 83 101 113 117 101 110 99 101] Value:[49 49] XXX_NoUnkeyedLiteral:{} XXX_unrecognized:[] XXX_sizecache:0} {Key:[69 120 112 105 114 101 84 105 109 101] Value:[49 53 57 55 53 52 51 49 57 51] XXX_NoUnkeyedLiteral:{} XXX_unrecognized:[] XXX_sizecache:0} {Key:[97 99 116 105 111 110] Value:[99 114 111 115 115 84 114 97 110 115 102 101 114 79 117 116] XXX_NoUnkeyedLiteral:{} XXX_unrecognized:[] XXX_sizecache:0}] XXX_NoUnkeyedLiteral:{} XXX_unrecognized:[] XXX_sizecache:0}] Codespace: XXX_NoUnkeyedLiteral:{} XXX_unrecognized:[] XXX_sizecache:0})
```

## Transfer SCOL from SCOL to BC

### transferOut

Call **transferOut** of [TokenHub contract](https://raw.githubusercontent.com/shree-chain/nc-genesis-contract/master/abi/tokenhub.abi) in [MyEtherWallet](https://www.myetherwallet.com/):

![img](https://lh3.googleusercontent.com/q8-nnt12h8gvYyMe6iwLalwzY-1jHfQ11BsSyIz3qkQPCjp_-D-dIzPxZ-HuMJngCxTs7pt65-zSUIYImpsoO8bJ_QC_pyfPMu_2O7Lh65uDvVXrkhKqOakI070vKuEK3UNnlk8m)



| Parameter Name | Type    | Description                                                  |
| -------------- | ------- | ------------------------------------------------------------ |
| contractAddr   | address | for SCOL, the value must be 0x0000000000000000000000000000000000000000 |
| recipient      | address | decode bech32 address, starting with `0x` . To transfer to hex string. This is a online too to decode bech32: https://slowli.github.io/bech32-buffer/ |
| amount         | uint256 | The SCOL decimals on  SCOL is 18. If you want to transfer one SCOL, then the value should be 1e18. Besides, the value must be N * 1e10 |
| expireTime     | uint256 | Timestamp, counted by  second                                |

The value here should follow this equation:

```
txValue = (amount + RelayFee)/1e18
```

`RelayFee` should be 0.01SCOL and it can be updated by on-chain governance. For example, if you transfer 1SCOL from SCOL to BC, the value should be at least 1.01SCOL.

After all the above parameters have been set to proper values, users can click the transact button to build transactions, and metamask plugin will be ejected. Then users can click the confirm button in metamask to sign and broadcast transactions.


### batchTransferOutSCOL

Call **batchTransferOutSCOL** of TokenHub contract in MyEtherWallet:

![img](../../assets/batchTransferOutSCOL.png)

| Parameter Name | Type      | Description                                                  |
| -------------- | --------- | ------------------------------------------------------------ |
| recipientAddrs | address[] | decode bech32 address  to hex string. This is a online too to decode bech32: https://slowli.github.io/bech32-buffer/0 |
| amounts        | uint256[] | amount for each  recipient, should be N * 1e10               |
| refundAddrs    | address[] | sender can specify  some address as the refund address if the cross chain transfer is failed. |
| expireTime     | uint256   | Timestamp, counted by  second                                |


The value here should follow this equation:

```
txValue = (sumOfAmounts + RelayFee * batchSize)/1e18
```

## Transfer BEP2 to TC
Execute the following command to transfer ABC-A64 token to TC:
```bash
## mainnet
eth-cli bridge transfer-out --to 0xEe9546E92e6876EdF6a234eFFbD72d75360d91f0 --expire-time 1597543193 --chain-id SCOL-Chain-Tigris --from owner --amount 10000000000:ABC-A64 --node http://dataseed4.scolcoin.com:80

## testnet
eth-cli bridge transfer-out --to 0xEe9546E92e6876EdF6a234eFFbD72d75360d91f0 --expire-time 1597543193 --chain-id SCOL-Chain-Ganges --from owner --amount 10000000000:ABC-A64 --node http://data-seed-pre-0-s3.scolcoin.com:80
```
## Transfer SRC20 to BC
Before calling **transferOut** or **batchTransferOut**, users need to call **approve** method to grant enough allowance to TokenHub contract. For **transferOut** method, the allowance should equal the transfer amount. For **batchTransferOut**, the allowance should be the sum of the amount array.

### transferOut

![img](https://lh3.googleusercontent.com/q8-nnt12h8gvYyMe6iwLalwzY-1jHfQ11BsSyIz3qkQPCjp_-D-dIzPxZ-HuMJngCxTs7pt65-zSUIYImpsoO8bJ_QC_pyfPMu_2O7Lh65uDvVXrkhKqOakI070vKuEK3UNnlk8m)

| Parameter Name | Type    | Description                                                  |
| ------------   | ------- | ------------------------------------------------------------ |
| contractAddr   | address | SRC20 contract address                                       |
| recipient      | address | decode bech32 address  to hex string. This is a online too to decode bech32: https://slowli.github.io/bech32-buffer/ |
| amount         | uint256 | SRC20 token amount.  Here the decimals is 18, so the amount must be N * 1e10. |
| expireTime     | uint256 | Timestamp, counted by  second                                |

The value here should be RelayFee.

### Mint

If both the SRC20 token and bep2 token are mintable, then token owners can still mint their tokens even after token binding. Besides, token owners need to ensure the total supply and the locked amount on both chains are still matched, otherwise, users might can’t transfer their tokens to another chain.

#### Mint token on BC

1. Execute the following command to mint 10000 ABC-A64:
```bash
## mainnet
eth-cli token mint --symbol ABC-A64 --amount 1000000000000 --from owner --chain-id SCOL-Chain-Tigris --node http://dataseed4.scolcoin.com:80

## testnet
eth-cli token mint --symbol ABC-A64 --amount 1000000000000 --from owner --chain-id SCOL-Chain-Ganges --node http://data-seed-pre-0-s3.scolcoin.com:80
```

2. Mint token on SCOL and lock the new minted token:
* Call **mint** method of SRC20 contract, the mint amount should be 1e22.
* Transfer all minted ABC token to tokenHub contract: `0x0000000000000000000000000000000000001004`

#### Mint token on TC

1. Call **mint** of SRC20 contract to mint 10000 ABC, the mint amount should be 1e22(18 decimals).
2. Mint token on BC and lock the new minted token:

* Execute the following command to mint 10000 ABC-A64:
```bash
## mainnet
eth-cli token mint --symbol ABC-A64 --amount 1000000000000 --from owner --chain-id SCOL-Chain-Tigris --node http://dataseed4.scolcoin.com:80

## testnet
eth-cli token mint --symbol ABC-A64 --amount 1000000000000 --from owner --chain-id SCOL-Chain-Ganges --node http://data-seed-pre-0-s3.scolcoin.com:80
```
* Transfer all minted ABC-A64 token to the pure-code-controlled address: `tscol1v8vkkymvhe2sf7gd2092ujc6hweta38xnc4wpr`(mainnet address: `scol1v8vkkymvhe2sf7gd2092ujc6hweta38xadu2pj`)