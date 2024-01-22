#!/bin/bash

# function_loading () {
#   source "${GIT_HOME}"/scripts/env.sh
# }

# function_release_image () {
#   # cargando scripts
#   function_loading

#   # cargando variables globales
#   function_env_global

#   if [ -z "${DOCKERHUB_USER}" ]
#   then
#     echo "variable DOCKERHUB_USER no detectada"
#     exit 1
#   fi

#   if [ -z "${DOCKERHUB_PASS}" ]
#   then
#     echo "variable DOCKERHUB_PASS no detectada"
#     exit 1
#   fi

#   # ejecutando proceso
#   docker tag "${DOCKERHUB_USER}"/"${SERVICE}":latest "${DOCKERHUB_USER}"/"${SERVICE}":"${GITHUB_RUN_ID}"

#   # login
#   echo "${DOCKERHUB_PASS}" | docker login --username "${DOCKERHUB_USER}" --password-stdin

#   # publicando imagen
#   docker push "${DOCKERHUB_USER}"/"${SERVICE}":latest
#   docker push "${DOCKERHUB_USER}"/"${SERVICE}":"${GITHUB_RUN_ID}"
# }

"$@"