#!/usr/bin/env bash

file=$1

if [ ! -e "$file" ]; then
  cat -
  exit 0
fi

blacklist=($(cat $file))

function contains () {
  for item in ${blacklist[@]}; do
    if [ $(echo $1 | grep ${item}) ]; then
      return 0
    fi
  done
  return 1
}

for line in $(cat -); do
  if contains $line; then
    continue
  fi
  echo $line
done
