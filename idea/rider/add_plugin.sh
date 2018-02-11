#!/bin/bash

PLUGIN_URL=$1
PLUGIN_TYPE=$2
PLUGIN_NAME=$3

mkdir -p $IDE_CONFIG_HOME/config/plugins/

if [ "$PLUGIN_TYPE" == "JAR" ]
then
  curl -SL $PLUGIN_URL --output $IDE_CONFIG_HOME/config/plugins/$PLUGIN_NAME.jar
else
  curl -SL $PLUGIN_URL --output $HOME/temp.zip
  unzip $HOME/temp.zip -d $IDE_CONFIG_HOME/config/plugins/
  rm $HOME/temp.zip
fi
