#!/bin/bash

if [ "$1" = "" ]; then
  read arg
  echo $arg | awk '{print $1 * 2}'
else
  echo $1 | awk '{print $1 * 2}'
fi
