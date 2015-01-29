#!/bin/bash

echo "Number of arguments: $#"
if [ $# -eq 0 ]; then
  echo "Script was executed without any argument"
else
  counter=1
  while [ $1 ]; do
    echo "Arg $counter is $1"
    shift
    counter=`expr $counter + 1`
  done
fi
