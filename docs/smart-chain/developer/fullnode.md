# How to Run A Fullnode on ScolCoin Chain

## Fullnodes Functions

* Stores the full blockchain history on disk and can answer the data request from the network.
* Receives and validates the new blocks and transactions.
* Verifies the states of every accounts.

## Supported Platforms

We support running a full node on `Mac OS X`and `Linux`.

## Suggested Requirements

### Fullnode
- VPS running recent versions of Mac OS X or Linux.
- 4 cores of CPU and 8 gigabytes of memory (RAM).
- A broadband Internet connection with upload/download speeds of 5 megabyte per second


## Steps to Run a Full Node

Download  scol_mainnet.json and static-nodes.json from  https://github.com/githubusername/githubrepo

```
wget  https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/scol_mainnet.json
wget https://raw.githubusercontent.com/scolcoin/ScolNetwork/master/static-nodes.json
```

Make node folder

```
mkdir node
```

Initialize the Node
```
./geth --datadir ./node init scol_mainnet.json
```

Copy the static-nodes.json to node/geth

Run the Nodes

```
./geth --datadir node --syncmode 'full' --gcmode=archive   --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://77f7dbb542cc7278d4a8bcb70cf142da58fe796aa7a9092908ac4481ce76079a5404e83bc0460cbf0278f9662d3593136a3a906ceb517d6e11c84222e1ebaecc@185.249.227.141:0?discport=40606 --networkid 65450 --allow-insecure-unlock

```
