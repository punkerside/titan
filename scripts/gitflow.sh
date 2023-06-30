#!/bin/bash

function_loading () {
  source "${GIT_HOME}"/scripts/build.sh
  source "${GIT_HOME}"/scripts/env.sh
  source "${GIT_HOME}"/scripts/gitflow.sh
  source "${GIT_HOME}"/scripts/login.sh
  source "${GIT_HOME}"/scripts/release.sh
  source "${GIT_HOME}"/scripts/terraform.sh
  source "${GIT_HOME}"/scripts/test.sh
}


function_gitflow_release () {
  # cargando scripts
  function_loading

  # cargando variables globales
  function_env_global

  # ejecutando proceso
  docker run -e GITHUB_TOKEN=${GIT_TOKEN} -e GITHUB_REPO=$(echo "${GITHUB_REPOSITORY}" | cut -d "/" -f2) punkerside/gh:latest
}

"$@"