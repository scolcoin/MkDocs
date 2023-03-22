# ScolCoin Chain Validator Overview

## What is ScolCoin Chain?

ScolCoin Chain is an innovative solution to bring programmability and interoperability to ScolCoin Chain. ScolCoin Chain relies on a system of 21 validators with [Proof of Staked Authority (PoSA) consensus](https://github.com/githubusername/githubrepo/whitepaper/blob/master/WHITEPAPER.md#consensus-and-validator-quorum) that can support short block time and lower fees. The most bonded validator candidates of staking will become validators and produce blocks. The double-sign detection and other slashing logic guarantee security, stability, and chain finality.

## What is Validator?

ScolCoin Chain relies on a set of validators who are responsible for committing new blocks in the blockchain. These validators participate in the consensus protocol by signing blocks that contain cryptographic signatures signed by each validator's private key.  The validator set is determined by a staking module built on ScolCoin Chain for ScolCoin Chain, and propagated every day UTC 00:00 from BC to SCOL via Cross-Chain communication.


## Economics

Validator's rewards come from transaction fees and commission fees from delegators.

Let us also assume that the reward for a block is 100 SCOL and that a certain validator has 20% of self-bonded SCOL and sets its commission rate to 20%. These tokens do not go directly to the proposer. Instead, they are shared among validators and delegators.  These 100 SCOL will be distributed according to each participant's stake:

Commission: 80*20%= 16 SCOL
Validator gets: 100\*20% + Commission = 36 SCOL
All delegators get: 100\*80% - Commission = 64 SCOL

If validators double sign, are frequently offline, their staked SCOL ( not including SCOL of users that delegated to them) can be slashed. The penalty depends on the severity of the violation.

You can learn to see the revenue history from BitQuery's [chart](https://explorer.bitquery.io/bsc/miners) or a table of [BscScan](https://scolcoin.com/validatorset)

## Risks for Validators

If you try to cheat the system, or act contrary to the specification, you will be liable to incur a penalty, known as **slashing**.


### Potential Loss


#### Loss for Double-Sign Slash

Running your validator keys simultaneously on two or more machines will result in Double-Sign slashing.

Penalty for Double-Sign Slash:

1. 10000 staked SCOL will be slashed for the validator.
2. The Double-Sign Jail time is 2^63-1 seconds, which means the candidate cannot become a validator anymore.

> Note: Rewards for submitting double-sign evidence: 1000SCOL Anyone can submit a slashing request on BC with the evidence of Double Sign of TC, which should contain the 2 block headers with the same height and parent block, sealed by the offending validator.


#### Loss for Offline Slash:


If a validator missed more than 50 blocks every 24h, the blocking reward for validator will not be relayed to BC for distribution but shared with other better validators. If it missed more than 150 blocks every 24h, then this will be propagated back to BC where another Slashing will happen

Penalty for Offline Slash:

1. 50 staked SCOL will be slashed for the validator.
2. The Downtime Jail time is 2 days, which means the candidate can send a `unjail` transaction to become a candidate again.



#### Loss for Too Low self-delegation

Validator candidates must stake 10000SCOL as self-delegation. If the self-delegation amount is lower, the Jail time is 1 day.
