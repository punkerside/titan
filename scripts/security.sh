#!/bin/bash

function_loading () {
  source "${GIT_HOME}"/scripts/env.sh
}

function_security_iac () {
  # cargando scripts
  function_loading

  # cargando variables globales
  function_env_global

  # cargando variables docker
  function_env_docker

  # confirmar variables
  if [ -z "${SNYK_TOKEN}" ]
  then
    echo "variable SNYK_TOKEN no detectada"
    exit 1
  fi

  if [ "${GITHUB_REPOSITORY}" != "" ]
  then
    export SNYK_APP="${GITHUB_REPOSITORY}"
  else
    export SNYK_APP=$(echo "${PWD}" | rev | cut -d "/" -f1 | rev)
  fi

  # ejecutando proceso
  docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}":/app \
    -e SNYK_ORG="${SNYK_ORG}" \
    -e SNYK_APP="${SNYK_APP}" \
    -e SNYK_TOKEN="${SNYK_TOKEN}" \
  punkerside/snyk:latest snyk_iac
}

"$@"