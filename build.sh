#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIVIDER="======================================="


images=(           \
  vim/base         \
  vim/js           \
  vim/ts           \
  vim/ts2          \
  vim/mono         \
  vim/rust         \
  vim/rust-nightly \
  vim/eclim        \
  vim/pony         
  vim/ocaml
)

echo $DIVIDER
echo "= Building ${#images[*]} docker images."
echo $DIVIDER

for image in ${images[*]}
do
  echo $DIVIDER
  IMAGE=env/$image
  echo "= Building $IMAGE"
  echo $DIVIDER
  cd $DIR/$image
  [ -f "pre-build.sh" ] && ./pre-build.sh
  docker build -t $IMAGE .
  [ -f "post-build.sh" ] && ./post-build.sh
  cd $DIR
done
