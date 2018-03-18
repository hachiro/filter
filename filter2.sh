#!/usr/bin/env bash

file=$1

if [ ! -e "$file" ]; then
  cat -
  exit 0
fi

blacklist=($(cat $file))

grep_command="grep"

for item in $(cat $file); do
  grep_command="$grep_command -e \"${item}\""
done

for line in $(cat -); do
  if [ $(echo $line | eval $grep_command) ]; then
    continue
  fi
  echo $line
done
