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

function_security_iac () {
  # cargando scripts
  function_loading
  function_env_global

  # ejecutando proceso

}

"$@"