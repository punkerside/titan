#!/bin/bash

# loading function
source .scripts/scripts/env.sh

# executing script
script_env_global

# validating result
if [ -z "${project}" ]
then
    echo "\$project is empty"
    rm -rf .scripts/testing/${line}/result.txt
    exit 1
else
    touch .scripts/testing/${line}/result.txt
fi

# validating result
if [ -z "${repoType}" ]
then
    echo "\$repoType is empty"
    rm -rf .scripts/testing/${line}/result.txt
    exit 1
else
    touch .scripts/testing/${line}/result.txt
fi

# validating result
if [ -z "${service}" ]
then
    echo "\$service is empty"
    rm -rf .scripts/testing/${line}/result.txt
    exit 1
else
    touch .scripts/testing/${line}/result.txt
fi

# validating result
if [ -z "${dockerhubUser}" ]
then
    echo "\$dockerhubUser is empty"
    rm -rf .scripts/testing/${line}/result.txt
    exit 1
else
    touch .scripts/testing/${line}/result.txt
fi

# validating result
if [ -z "${env}" ]
then
    echo "\$env is empty"
    rm -rf .scripts/testing/${line}/result.txt
    exit 1
else
    touch .scripts/testing/${line}/result.txt
fi
