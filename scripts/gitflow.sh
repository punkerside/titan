#!/bin/bash

export AWS_DEFAULT_REGION="us-east-1"

function_loading () {
  source "${GIT_HOME}"/scripts/build.sh
  source "${GIT_HOME}"/scripts/env.sh
  source "${GIT_HOME}"/scripts/gitflow.sh
  source "${GIT_HOME}"/scripts/release.sh
}


function_gitflow_release () {
  # cargando scripts
  function_loading
  function_env_global
  function_env_docker

  # ejecutando proceso
  docker run -e GITHUB_TOKEN=${GIT_TOKEN} -e GITHUB_REPO=$(echo "${GITHUB_REPOSITORY}" | cut -d "/" -f2) punkerside/titan-release:latest
}

"$@"