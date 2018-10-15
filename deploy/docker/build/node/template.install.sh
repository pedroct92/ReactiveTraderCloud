#! /bin/bash

set -euo pipefail

# dependencies for npm install
apt-get update
apt-get install curl build-essential git python -y

# node
# Install manually to easily choose the version
curl -L -O https://nodejs.org/dist/v__NODE_VERSION__/node-v__NODE_VERSION__-linux-x64.tar.gz
tar -zxvf node-v__NODE_VERSION__-linux-x64.tar.gz
rm -r node-v__NODE_VERSION__-linux-x64.tar.gz
mv node-v__NODE_VERSION__-linux-x64 /node

# clean
apt-get remove curl -y
apt-get autoremove -y
