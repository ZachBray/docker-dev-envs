#!/bin/bash

function intellij() {
  eval bash /$INTELLIJ_HOME/bin/idea.sh $1 >> /dev/null &
}

function rider() {
  eval bash /$RIDER_HOME/bin/rider.sh $1 >> /dev/null &
}

function webstorm() {
  eval bash /$WEBSTORM_HOME/bin/webstorm.sh $1 >> /dev/null &
}

