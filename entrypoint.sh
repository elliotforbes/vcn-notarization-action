#!/bin/bash

set -eoux pipefail

setup() {
    curl -L -o /tmp/vcn https://github.com/vchain-us/vcn/releases/download/v0.9.4/vcn-v0.9.4-linux-amd64-static
    CHECKSUM=$(sha256sum /tmp/vcn | cut -d " " -f 1)
    echo $CHECKSUM
    curl -s https://api.codenotary.io/authenticate/$CHECKSUM?org=vchain.us | grep -q :0
    chmod +x /tmp/vcn
}

main() { 
    /tmp/vcn login
    /tmp/vcn n -p --attr GitHub="${GITHUB_SHA:0:7}" docker://forbsey/notarized-image:latest
}

main