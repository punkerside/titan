#!/bin/bash

# loading function
source .scripts/scripts/env.sh

# dependencies
script_env_global
script_env_release

# delete image
login_data() {
cat <<EOF
{
  "username": "${dockerhubUser}",
  "password": "${dockerhubPass}"
}
EOF
}

TOKEN=`curl -s -H "Content-Type: application/json" -X POST -d "$(login_data)" "https://hub.docker.com/v2/users/login/" | jq -r .token`
curl "https://hub.docker.com/v2/repositories/${dockerhubUser}/${service}-${env}/tags/${releaseVersion}/" -X DELETE -H "Authorization: JWT ${TOKEN}"

# executing script
make release_image

# debug
sleep 2s

# validating result
if [ $(curl https://hub.docker.com/v2/repositories/${dockerhubUser}/${service}-${env}/tags?page_size=1000 | jq .results[].name | grep ${releaseVersion} | wc -l) = 1 ]
then
  touch .scripts/testing/${line}/result.txt
fi

