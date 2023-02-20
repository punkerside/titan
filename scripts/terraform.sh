#!/bin/bash

export AWS_DEFAULT_REGION="us-east-1"

function_loading () {
  source "${GIT_HOME}"/scripts/build.sh
  source "${GIT_HOME}"/scripts/env.sh
  source "${GIT_HOME}"/scripts/gitflow.sh
  source "${GIT_HOME}"/scripts/release.sh
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