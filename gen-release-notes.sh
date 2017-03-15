#!/bin/bash

if [[ $1 == "" ]]; then
  echo "Expeccted arg 1 to be version (1.2.3)"
  exit 1
fi

git log --no-merges --pretty=format:'%s %H (%aN)' HEAD "^$1"
