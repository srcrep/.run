#!/bin/bash
#
#
# install prereqs
#
#
sudo apt-get update &&
sudo apt-get upgrade &&
sudo apt-get install -y build-essential &&
sudo apt-get install git &&
cd ~ &&
git clone https://github.com/ethereum/go-ethereum.git &&
cd ~ &&
#
#
# install go
#
#
cd ~ $ wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz &&
#
#
# unpack go
#
#
sudo tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz &&
#
#
# add to bash
#
#
export PATH="$PATH:/usr/local/go/bin" &&
#
#
# build geth
#
#
cd ~ &&
cd go-ethereum &&
make geth &&
#
#
# create account
#
#
cd ~ &&
mkdir gethDataDir &&
geth account new --datadir ~/gethDataDir &&
#
#
# Configuring the Genesis Block:
#
# The Genesis block is the inception of blocks while starting a network for the first time. We can configure the genesis blocks with various parameter below to have some funds already while starting up the Network for created accounts. Create a file in genesis.json in the Data Dir i.e. ~/gethDataDir in our case. Remember, the Account address must be replaced with your newly generated account.
#
# Genesis Block Config
#
#{
#    "config": {
#        "chainId": 99,
#        "homesteadBlock": 0,
#        "eip155Block": 0,
#        "eip158Block": 0
#    },
#    "difficulty": "1",
#    "gasLimit": "2100000",
#    "alloc":{
#            "yourNewlyCreatedAccountAddressMustGoHere": {
#            "balance": "300000"
#        }
#    }
#}
#
#Initialize the blockchain with below commands:
#
cd ~/gethDataDir &&
geth --datadir ~/gethDataDir/ init genesis.json
#
# Verify the set up by starting Ethereum:
# cd ~
# geth --datadir ~/gethDataDir --networkid 99
