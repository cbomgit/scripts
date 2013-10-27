#!/bin/bash

PID=""

start() {

   ~/.bin/lobatt &

   PID=$!
   
   echo "$PID" > ~/.battmon.pid 
}

stop() {

   kill $(cat ~/.battmon.pid)
   rm ~/.battmon.pid

}

$1
