#!/bin/bash

# loading function
source .scripts/scripts/env.sh

# executing script
script_env_release

# validating result
if [ -z "${releaseVersion}" ]
then
    echo "\$releaseVersion is empty"
    rm -rf .scripts/testing/${line}/result.txt
    exit 1
else
    touch .scripts/testing/${line}/result.txt
fi
