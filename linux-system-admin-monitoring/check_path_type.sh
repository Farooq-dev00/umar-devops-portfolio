#!/bin/bash

path=$1

if [ -f "$path" ]; then
  echo "$path is a file."
elif [ -d "$path" ]; then
  echo "$path is a directory."
else
  echo "$path is not a file or directory."
fi
