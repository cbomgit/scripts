#!/bin/bash

DB_PATH="/home/christian/Seafile/Private"
if [ ! -f $DB_PATH/keepdb.kdb.lock ]; then
   NAME="keepdb.kdb_$(date +"%y-%m-%d")"
   cp -v $DB_PATH/keepdb.kdb $DB_PATH/$NAME
fi
