#!/bin/bash

function ide() {
  eval bash $IDE_HOME/$IDE_BUILD/bin/idea.sh $1 >> /dev/null &
}
