cp template/Dockerfile Dockerfile
sed -i -e 's/<<RUST_VERSION>>/1.10.0/g' Dockerfile
sed -i -e 's/<<RUSTUP_ARGS>>/--revision=$RUST_VERSION/g' Dockerfile
