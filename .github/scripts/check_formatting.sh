#!/bin/bash

# Define colors
WHITE='\033[0m'
GREEN='\033[32m'
RED='\033[31m'

# Run formatter
output=$(dart format -o none .)

if [ $? -eq 0 ]
then
  formatted=$(echo "$output" | grep "(0 changed)")
  if [ $? -eq 0 ]
  then
    echo "$output" | tail -n 1
    echo -e "${GREEN}Formatting check passed.${WHITE}"
    exit 0
  else
    echo "$output"
    echo -e "${RED}ERROR: Formatting check failed!${WHITE}"
    exit 1
  fi
else
  echo "${RED}ERROR: `dart format` command failed!${WHITE}"
  echo "$output"
fi
