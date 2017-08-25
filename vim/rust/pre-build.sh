cp template/Dockerfile Dockerfile
sed -i -e 's/<<RUST_VERSION>>/stable/g' Dockerfile
