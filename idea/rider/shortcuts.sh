#!/bin/bash

function ide() {
  eval bash /$IDE_VERSION/bin/rider.sh $1 >> /dev/null &
}
