#!/bin/bash

# loading function
source .scripts/scripts/build.sh
source .scripts/scripts/env.sh

# setting testsActivated variable
export testsActivated=true

# dependencies
script_env_global

# deleting image
docker rmi "${dockerhubUser}"/"${service}"-"${env}":latest

# executing function
script_build_image

# validating result
if [ $(docker images | grep core-dev | wc -l) = 1 ]
then
  touch .scripts/testing/${line}/result.txt
fi