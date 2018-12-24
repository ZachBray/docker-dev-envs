#!/bin/bash

set -eux

ide_home=$1

mkdir -p $ide_home/lib/keymaps
cp \$default.xml $ide_home/lib/keymaps/
cd $ide_home/lib
jar uf resources.jar keymaps/\$default.xml
