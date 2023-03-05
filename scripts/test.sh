#!/bin/bash

export AWS_DEFAULT_REGION="us-east-1"

function_loading () {
  source "${GIT_HOME}"/scripts/build.sh
  source "${GIT_HOME}"/scripts/env.sh
  source "${GIT_HOME}"/scripts/gitflow.sh
  source "${GIT_HOME}"/scripts/login.sh
  source "${GIT_HOME}"/scripts/release.sh
  source "${GIT_HOME}"/scripts/terraform.sh
}

function_test_awspec () {
  # cargando scripts
  function_loading
  function_env_global
  function_env_docker
  function_login_aws

  # ejecutando pruebas
  docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}":/app \
    -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    -e AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
    -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
  punkerside/titan-awspec:latest
}

"$@"