#!/bin/bash

script_env_global () {
  if [ -z "${GITHUB_RUN_ID}" ]
  then
    echo "variable GITHUB_RUN_ID no detectada"
  fi

  if [ "${GITHUB_REPOSITORY}" != "" ]
  then
    PROJECT=$(echo "${GITHUB_REPOSITORY}" | cut -d "/" -f2 | cut -d "-" -f1)
    SERVICE=$(echo "${GITHUB_REPOSITORY}" | cut -d "/" -f2 | cut -d "-" -f2-50)
    export PROJECT="${PROJECT}"
    export SERVICE="${SERVICE}"
  else
    PROJECT=$(echo "${PWD}" | rev | cut -d "/" -f1 | rev | cut -d "-" -f1)
    SERVICE=$(echo "${PWD}" | rev | cut -d "/" -f1 | rev | cut -d "-" -f2-50)
    export PROJECT="${PROJECT}"
    export SERVICE="${SERVICE}"
  fi

  ENV="prod"
  export ENV="${ENV}"

  AWS_DEFAULT_REGION="us-east-1"
  export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

  TF_ORGANIZATION="punkerside"
  export TF_ORGANIZATION=${TF_ORGANIZATION}

  DOCKERHUB_USER="punkerside"
  export DOCKERHUB_USER=${DOCKERHUB_USER}

  SNYK_ORG="punkerside"
  export SNYK_ORG=${SNYK_ORG}
}

# function_env_docker () {
#   DOCKER_UID=$(id -u)
#   DOCKER_GID=$(id -g)
#   DOCKER_USER=$(whoami)
#   export DOCKER_UID="${DOCKER_UID}"
#   export DOCKER_GID="${DOCKER_GID}"
#   export DOCKER_USER="${DOCKER_USER}"
#   echo ''"${DOCKER_USER}"':x:'"${DOCKER_UID}"':'"${DOCKER_GID}"'::/app:/sbin/nologin' > passwd
# }

"$@"