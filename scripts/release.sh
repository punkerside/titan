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

function_release_image () {
  # cargando scripts
  function_loading
  function_env_global

  echo "DOCKERHUB_USER: ${DOCKERHUB_USER}"

  if [ -z "${DOCKERHUB_USER}" ]
  then
    echo "variable DOCKERHUB_USER no detectada"
    exit 1
  fi

  if [ -z "${DOCKERHUB_PASS}" ]
  then
    echo "variable DOCKERHUB_PASS no detectada"
    exit 1
  fi

  # ejecutando proceso
  docker tag "${PROJECT}-${TYPE}-${SERVICE}":release ${DOCKERHUB_USER}/"${PROJECT}-${TYPE}-${SERVICE}":latest
  docker tag "${PROJECT}-${TYPE}-${SERVICE}":release ${DOCKERHUB_USER}/"${PROJECT}-${TYPE}-${SERVICE}":${GITHUB_RUN_ID}

  # login
  echo ${DOCKERHUB_PASS} | docker login --username ${DOCKERHUB_USER} --password-stdin

  # publicando imagen
  docker push ${DOCKERHUB_USER}/"${PROJECT}-${TYPE}-${SERVICE}":latest
  docker push ${DOCKERHUB_USER}/"${PROJECT}-${TYPE}-${SERVICE}":${GITHUB_RUN_ID}
}

"$@"