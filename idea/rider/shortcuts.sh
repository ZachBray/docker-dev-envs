#!/bin/bash

function ide() {
  eval bash "\"$IDE_BIN\"" $1 >> /dev/null &
}
