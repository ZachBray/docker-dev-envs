#!/bin/bash

ide_home=$1
plugin_id=$2
plugin_type=$3
plugin_name=$4

plugin_url="https://plugins.jetbrains.com/plugin/download?rel=true&updateId=$plugin_id"
plugin_dir=$ide_home/plugins

mkdir -p $plugin_dir

if [ "$plugin_type" == "JAR" ]
then
  curl -SL $plugin_url --output $plugin_dir/$plugin_name.jar
else
  tmp_archive=/tmp/ide_plugin.zip
  curl -SL $plugin_url --output $tmp_archive
  unzip $tmp_archive -d $plugin_dir/
  rm $tmp_archive
fi
