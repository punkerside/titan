#!/bin/bash

# setting testsActivated variable
export testsActivated=true

# executing script
make lint_hadolint > result.txt

# validating result
if [ $(cat result.txt | grep warning | wc -l) -gt 0 ]
then
  touch .scripts/testing/${line}/result.txt
fi
