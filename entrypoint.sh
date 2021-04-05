#!/bin/bash

set -euox pipefail

setup() {
    curl -L -o /tmp/vcn https://github.com/vchain-us/vcn/releases/download/v0.9.4/vcn-v0.9.4-linux-amd64-static
    CHECKSUM=$(sha256sum /tmp/vcn | cut -d " " -f 1)
    curl -s https://api.codenotary.io/authenticate/$CHECKSUM?org=vchain.us | grep -q :0
    chmod +x /tmp/vcn
}

main() {
    echo | /tmp/vcn login
    /tmp/vcn n -p $1
}

setup
main $1