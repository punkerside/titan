#!/bin/bash

script_env_global () {
  # variables globales
  if [ "${GITHUB_REPOSITORY}" != "" ]
  then
    project=$(echo "${GITHUB_REPOSITORY}" | cut -d "/" -f2 | cut -d "-" -f1)
    repoType=$(echo "${GITHUB_REPOSITORY}" | cut -d "/" -f2 | cut -d "-" -f2)
    service=$(echo "${GITHUB_REPOSITORY}" | cut -d "/" -f2 | cut -d "-" -f3-50)
    export project="${project}"
    export repoType="${repoType}"
    export service="${service}"
  else
    project="titan"
    repoType="script"
    service="core"
    env="dev"
    export project="${project}"
    export repoType="${repoType}"
    export service="${service}"
    export env="${env}"
  fi

  # variables dockerhub
  dockerhubUser="punkerside"

  # ENV="prod"
  # export ENV="${ENV}"

  # AWS_DEFAULT_REGION="us-east-1"
  # export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

  # TF_ORGANIZATION="punkerside"
  # export TF_ORGANIZATION=${TF_ORGANIZATION}

  # DOCKERHUB_USER="punkerside"
  # export DOCKERHUB_USER=${DOCKERHUB_USER}

  # SNYK_ORG="punkerside"
  # export SNYK_ORG=${SNYK_ORG}
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