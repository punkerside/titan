#!/bin/bash

# function_loading () {
#   source "${GIT_HOME}"/scripts/build.sh
#   source "${GIT_HOME}"/scripts/env.sh
#   source "${GIT_HOME}"/scripts/gitflow.sh
#   source "${GIT_HOME}"/scripts/login.sh
#   source "${GIT_HOME}"/scripts/release.sh
#   source "${GIT_HOME}"/scripts/terraform.sh
#   source "${GIT_HOME}"/scripts/test.sh
# }

# function_login_aws () {
#   # generando credenciales temporales
#   AWS_CREDENTIALS=$(aws sts get-session-token --duration-seconds 3600 --output json --region "${AWS_DEFAULT_REGION}")

#   # parseando credenciales
#   AWS_ACCESS_KEY_ID=$(echo "${AWS_CREDENTIALS}" | jq -r .Credentials.AccessKeyId)
#   AWS_SECRET_ACCESS_KEY=$(echo "${AWS_CREDENTIALS}" | jq -r .Credentials.SecretAccessKey)
#   AWS_SESSION_TOKEN=$(echo "${AWS_CREDENTIALS}" | jq -r .Credentials.SessionToken)
#   export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
#   export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
#   export AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}"
# }

"$@"