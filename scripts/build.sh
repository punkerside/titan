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

function_build_image () {
  # cargando scripts
  function_loading
  function_env_global

  # ejecutando proceso
  docker build -t "${PROJECT}-${TYPE}-${SERVICE}":release -f Dockerfile .
}




















function_build_code () {
  # cargando scripts
  function_loading
  function_env_global
  function_env_docker

  # depurando temporales
  rm -rf app/.npm/ app/node_modules/ app/package-lock.json app/app.zip

  # ejecutando proceso
  docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}"/app:/app punkerside/titan-npm:latest

  # depurando temporales
  rm -rf app/.npm/

  # empaquetando aplicacion
  cd app/ && zip -r app.zip .
}

function_build_packer () {
  # cargando scripts
  function_loading
  function_env_global
  function_env_docker

  # ejecutando proceso
  docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}":/app punkerside/titan-packer:latest
}

"$@"