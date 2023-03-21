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

function_terraform_cloud() {
  # cargando scripts
  function_loading
  function_env_global

  # creando terraformrc
  cat <<EOF > terraformrc
credentials "app.terraform.io" {
  token = "${TF_TOKEN}"
}
EOF
  
  # creando backend.hcl
  cat <<EOF > backend.hcl
workspaces { name = "${PROJECT}-${ENV}-${SERVICE}" }
hostname     = "app.terraform.io"
organization = "${TF_ORGANIZATION}"
EOF
}

"$@"