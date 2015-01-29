#!/bin/bash

if [ $# -lt 1 ]; then
  dirpath="."
  #dirpath=`pwd`
  #dirpath=`dirname $0` 
else
  dirpath=$1
fi

quantity=`ls -l $dirpath | grep "^-.*$" | wc -l`
echo "There are $quantity files"

sum=0
sizes=`ls -l $dirpath  | grep "^-.*$" | cut -f5 -d" "`

for number in $sizes; do
  sum=`expr $sum + $number`
done

echo "Total size: $sum bytes"
