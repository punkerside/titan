#!/bin/bash

# function_loading () {
#   source "${GIT_HOME}"/scripts/env.sh
# }

# function_lint_hadolint () {
#   # cargando scripts
#   function_loading

#   # cargando variables globales
#   function_env_global

#   # ejecutando proceso
#   docker run --rm -i hadolint/hadolint hadolint --ignore DL4006 "$@" - < Dockerfile
# }

"$@"