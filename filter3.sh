#!/usr/bin/env bash

file=$1

if [ ! -e "$file" ]; then
  cat -
  exit 0
fi

command="cat -"

for line in $(cat $file); do
  command="$command | grep -v \"$line\""
done

eval $command
