# Security

Each validator candidate is encouraged to run its operations independently, as diverse setups increase the resilience of the network.

## Sentry Nodes (DDOS Protection)

Validators are responsible for ensuring that the network can sustain denial of service attacks. One recommended way to mitigate these risks is for validators to carefully structure their network topology in a so-called sentry node architecture.
Sentry nodes can be quickly spun up or change their IP addresses. Because the links to the sentry nodes are in private IP space, an internet based attacked cannot disturb them directly. This will ensure validator block proposals and votes always make it to the rest of the network.

To setup your sentry node architecture you can follow the instructions below:

1. Build a private network and setup trusted private connections between validator node and it sentry

Please do not expose your validator fullnode RPC endpoints to public network.

Install your [fullnode](../developer/fullnode.md)

2. Set sentry as peers  for validator node

In the console of the sentry node, run `admin.nodeInfo.enode` You should get something similar to this.

```
enode://f2da64f49c30a0038bba3391f40805d531510c473ec2bcc7c201631ba003c6f16fa09e03308e48f87d21c0fed1e4e0bc53428047f6dcf34da344d3f5bb69373b@[::]:30306?discport=0
```

!!! Note:
	[::] will be parsed as localhost (127.0.0.1). If your nodes are on a local network check each individual host machine and find your IP with ifconfig
	If your peers are not on the local network, you need to know your external IP address (use a service) to construct the enode URL.
	Copy this value and in the console of the first node run,

Update `config.toml` file of validator node

```
# make node invisible
NoDiscovery = true
# connect only to sentry
StaticNodes = ["enode://f2da64f49c30a0038bba3391f40805d531510c473ec2bcc7c201631ba003c6f16fa09e03308e48f87d21c0fed1e4e0bc53428047f6dcf34da344d3f5bb69373b@[10.1.1.1]:30306"]
```
This will return true if successful, but that doesn’t mean the node was added successfully.


To confirm run `admin.peers` and you should see the details of the node you just added.


That way your validator node will try to peer with your provided sentry nodes only.


3. Confirm the connection

To confirm run `admin.peers` and you should see the details of the node you just added.


<img src="/assets/validator.png" alt="img" style="zoom:33%;" />

## Firewall Configuration

`geth` uses several TCP ports for different purposes.

`geth` use a listener (TCP) port and a discovery (UDP) port, both on 30303 by default.

If you need to run JSON-RPC, you'll also need TCP port 8545. Note that JSON-RPC port should not be opened to the outside world, because from there you can do admin operations.
