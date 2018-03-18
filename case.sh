#!/usr/bin/env bash

# cat sample.txt | sh filter3.sh blacklist.txt | sh case.sh

function do_something () {
  case "${1##*.}" in
    "txt" ) echo $1 is text file ;;
    "xml" ) echo $1 is xml file ;;
  esac
}

export -f do_something
cat - | xargs -I{} bash -c "do_something {}"
