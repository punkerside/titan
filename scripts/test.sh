#!/bin/bash

# function_loading () {
#   source "${GIT_HOME}"/scripts/env.sh
# }

# function_test_awspec () {
#   # cargando scripts
#   function_loading

#   # cargando variables globales
#   function_env_global

#   # cargando variables docker
#   function_env_docker

#   if [ -z "${AWS_ACCESS_KEY_ID}" ]
#   then
#     echo "variable AWS_ACCESS_KEY_ID no detectada"
#     exit 1
#   fi

#   if [ -z "${AWS_SECRET_ACCESS_KEY}" ]
#   then
#     echo "variable AWS_SECRET_ACCESS_KEY no detectada"
#     exit 1
#   fi

#   # ejecutando pruebas
#   docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}":/app \
#     -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
#     -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
#     -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
#   punkerside/awspec:latest
# }

# function_test_precommit () {
#   # cargando scripts
#   function_loading
#   function_env_global
#   function_env_docker

#   # ejecutando pruebas
#   docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}":/app punkerside/precommit:latest
# }

"$@"