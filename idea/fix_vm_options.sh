#!/bin/bash

set -eux

ide_vm_options=$1

# remove incorrect entries
cat $ide_vm_options | grep -v 'Xms\|Xmx\|XX:ReservedCodeCacheSize' | tee $ide_vm_options

# add correct entries
echo "-Xms2048m" | tee -a $ide_vm_options
echo "-Xmx4096m" | tee -a $ide_vm_options
echo "-XX:ReservedCodeCacheSize=1024m" | tee -a $ide_vm_options

