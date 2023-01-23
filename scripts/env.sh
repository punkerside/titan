#!/bin/bash

export AWS_DEFAULT_REGION="us-east-1"

scripts_loading () {
  source "${GIT_HOME}"/scripts/build.sh
  source "${GIT_HOME}"/scripts/env.sh
  source "${GIT_HOME}"/scripts/release.sh
}

function_env_global () {
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
}

function_env_docker () {
  DOCKER_UID=$(id -u)
  DOCKER_GID=$(id -g)
  DOCKER_USER=$(whoami)
  export DOCKER_UID="${DOCKER_UID}"
  export DOCKER_GID="${DOCKER_GID}"
  export DOCKER_USER="${DOCKER_USER}"
  echo ''"${DOCKER_USER}"':x:'"${DOCKER_UID}"':'"${DOCKER_GID}"'::/app:/sbin/nologin' > passwd
}

"$@"