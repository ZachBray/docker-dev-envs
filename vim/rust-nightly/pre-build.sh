#!/bin/bash

# Soft/symbolic links are not supported by docker.
# Therefore we copy
cp ../rust/template/Dockerfile Dockerfile
cp -r ../rust/home home

# Fill in templated parameters
sed -i -e 's/<<RUST_VERSION>>/nightly/g' Dockerfile
