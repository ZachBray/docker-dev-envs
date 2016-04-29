#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIVIDER="======================================="


images=(        \
  vim/base      \
  vim/js        \
  js/default    \
  js/webpack    \
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
  docker build -t $IMAGE $DIR/$image
done