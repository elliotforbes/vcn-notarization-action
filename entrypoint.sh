#!/bin/sh

set -eou pipefail

main() {
    vcn 
    # VCN_USER=${{ secrets.CODENOTARY_USER }} VCN_PASSWORD=${{ secrets.CODENOTARY_PASS }} /tmp/vcn login
    # VCN_NOTARIZATION_PASSWORD=${{secrets.CODENOTARY_PASS}} /tmp/vcn n -p --attr GitHub="${GITHUB_SHA:0:7}" docker://forbsey/notarized-image:latest
}

main