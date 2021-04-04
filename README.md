VCN Notarization Github Action
================================

## Usage

In your workflow, define a step which will take in the desired image or file you wish to notarize:

```yml
steps:
# ...
   - name: Notarize with VCN
     uses: elliotforbes/vcn-notarization-action@master
     with:
        vcn_username: ${{ secrets.VCN_USERNAME }}
        vcn_password: ${{ secrets.VCN_PASS }}
        file: path/to/file # or docker://myimage
```

The possible inputs are:

* `vcn_username`: (string, required): your vcn username
* `vcn_password`: (string, required): your vcn password
* `file`: (string, required): the path to your file that you wish to notarize. This could be build artefact 

## Copyright

See [License](LICENSE)