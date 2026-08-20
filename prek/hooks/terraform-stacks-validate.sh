#!/usr/bin/env bash

set -e

export PATH=$PATH:/usr/local/bin

# Disable output not usually helpful when running in automation (such as guidance to run plan after init)
export TF_IN_AUTOMATION=1

# Store and return last failure from validate so this can validate every directory passed before exiting
VALIDATE_ERROR=0

for dir in $(echo "$@" | xargs -n1 dirname | sort -u | uniq); do
  echo "--> Running 'terraform stacks validate' in directory '$dir'"
  pushd "$dir" >/dev/null
  terraform stacks init -upgrade || VALIDATE_ERROR=$?
  terraform stacks providers-lock \
    -platform=darwin_amd64 \
    -platform=linux_amd64 || VALIDATE_ERROR=$?
  terraform stacks validate || VALIDATE_ERROR=$?
  popd >/dev/null
done

exit ${VALIDATE_ERROR}
