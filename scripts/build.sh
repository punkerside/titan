#!/bin/bash

source_loading () {
  source .scripts/scripts/env.sh
}

script_build_image () {
  # cargando scripts
  source_loading

  # cargando variables globales
  script_env_global

  # condicion necesaria para las pruebas
  if [ "${testsActivated}" = false ]
  then
    dirHome=$(pwd)
  else
    dirHome=$(pwd)/.scripts/testing/"${line}"
  fi

  echo "dirHome=${dirHome}"
  ls -la .scripts/testing/"${line}"/Dockerfile

  # ejecutando proceso
  docker build -t "${dockerhubUser}"/"${service}"-"${env}":latest -f "${dirHome}"/Dockerfile .
}





























# function_build_code () {
#   # cargando scripts
#   function_loading
#   function_env_global
#   function_env_docker

#   # depurando temporales
#   rm -rf app/.npm/ app/node_modules/ app/package-lock.json app/app.zip

#   # ejecutando proceso
#   docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}"/app:/app punkerside/titan-npm:latest

#   # depurando temporales
#   rm -rf app/.npm/

#   # empaquetando aplicacion
#   cd app/ && zip -r app.zip .
# }

# function_build_packer () {
#   # cargando scripts
#   function_loading
#   function_env_global
#   function_env_docker

#   # ejecutando proceso
#   docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}":/app punkerside/titan-packer:latest
# }

"$@"