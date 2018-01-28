#!/bin/bash

function ide() {
  eval bash /$IDE_HOME/bin/idea.sh $1 >> /dev/null &
}
