#!/bin/bash

source_loading () {
  source "${GIT_HOME}"/scripts/env.sh
}

script_lint_hadolint () {
  # condicion necesaria para las pruebas
  if [ "${testsActivated}" = false ]
  then
    dirHome=$(pwd)
  else
    dirHome=$(pwd)/.scripts/testing/"${line}"
  fi
  
  # ejecutando proceso
  docker run --rm -i hadolint/hadolint hadolint --ignore DL4006 "$@" - < "${dirHome}"/Dockerfile
}

"$@"