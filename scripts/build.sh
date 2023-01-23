#!/bin/bash

export AWS_DEFAULT_REGION="us-east-1"

scripts_loading () {
  source "${GIT_HOME}"/scripts/build.sh
  source "${GIT_HOME}"/scripts/env.sh
}

function_build_image () {
  # cargando scripts
  scripts_loading
  function_env_global

  # ejecutando proceso
  docker build -t "${PROJECT}-${ENV}-${SERVICE}":release -f Dockerfile .
}

"$@"