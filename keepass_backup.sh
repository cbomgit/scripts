#!/bin/bash
#first check if the database is locked, then see if a diff between yesterday's backup and today's current db exists

DB_PATH=/home/christian/Documents/Personal

if [ ! -f $DB_PATH/keepdb.kdb.lock ]; then
   yesterday=$(date -d "yesterday" '+%y-%m-%d')
   if [ ! -f $DB_PATH/keepdb.kdb_$yesterday ] || [[ $(diff $DB_PATH/keepdb.kdb $DB_PATH/keepdb.kdb_$yesterday) ]]; then
      cp -v $DB_PATH/keepdb.kdb $DB_PATH/keepdb.kdb_$(date '+%y-%m-%d')
   else
      echo "No changes to backup"
   fi
else
      echo "Database is locked"
fi
