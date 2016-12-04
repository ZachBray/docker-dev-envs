#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIVIDER="======================================="


images=(           \
  vim/base         \
  vim/js           \
  vim/ts           \
  vim/mono         \
  vim/rust         \
  vim/rust-nightly \
  vim/eclim        \
  vim/pony         \
  vim/ocaml
)

if [ $# -eq 1 ]
then
  images=(vim/$1)
fi

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
