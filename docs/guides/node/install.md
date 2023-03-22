# Install Binaries

This guide will explain how to install the binaries: `scolchaind`  and `eth-cli`, onto your server. With these installed on a server, you can participate in the mainnet or testnet as a Full Node. Full Nodes of ScolCoin Chain also help the network by accepting transactions from other nodes and then relaying them to the core SCOL network.

## Supported Platforms
We support running a full node on `Mac OS`, `Windows` and `Linux`.

### Option One: Installation Script

We have a community-maintained installer script (`install.sh`) that takes care of chain directory setup. This uses the following defaults:

- Home folder in `~/.scolchaind`
- Client executables stored in `/usr/local/bin` (i.e. `lightd` or `scolchaind`)

```
# One-line install
sh <(wget -qO- https://raw.githubusercontent.com/shree-chain/node-binary/master/install.sh)
```
The script will install the `scolchain`, `eth-cli` and `eth-cli` binaries. Verify that everything is OK:
```shell
$ scolchaind version
$ eth-cli version
```
### Option Two: Manual Installation

We currently use this repo to store historical versions of the compiled `node-binaries`.

1. Install Git LFS

Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside Git, while storing the file contents on a remote server like GitHub.com or GitHub Enterprise.

Please go to https://git-lfs.github.com/ and install `git lfs`.

2. Download Binary with Git LFS:

```
git lfs clonehttps://github.com/githubusername/githubrepo/node-binary.git
```

Please go to [changelog](https://github.com/githubusername/githubrepo/node-binary/blob/master/fullnode/Changelog.md) to get the information about the latest release of full node version.

Go to directory according to the network you want to join in.

3. Replace the `network` variable with `testnet` or `prod` in the following command:

```
cd node-binary/fullnode/{network}/{version}
```
4. Copy the executables (i.e.scolchaind or eth-cli) to /usr/local/bin

## Next
Now you can join the [mainnet](./join-mainnet.md), the public testnet or create you own testnet
