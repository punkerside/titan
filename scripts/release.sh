#!/bin/bash

source_loading () {
  source .scripts/scripts/env.sh
}

script_release_image () {
  # cargando scripts
  source_loading

  # cargando variables globales
  script_env_global

  # cargando variable releaseVersion
  script_env_release

  # ejecutando proceso
  docker tag "${dockerhubUser}"/"${service}"-"${env}":latest "${dockerhubUser}"/"${service}"-"${env}":"${releaseVersion}"

  # login
  echo "${dockerhubPass}" | docker login --username "${dockerhubUser}" --password-stdin

  # publicando imagen
  docker push "${dockerhubUser}"/"${service}"-"${env}":latest
  docker push "${dockerhubUser}"/"${service}"-"${env}":"${releaseVersion}"
}

"$@"