#!/usr/bin/env bash

set -e

export PATH=$PATH:/usr/local/bin

# Disable output not usually helpful when running in automation (such as guidance to run plan after init)
export TF_IN_AUTOMATION=1

# Store and return last failure from validate so this can validate every directory passed before exiting
VALIDATE_ERROR=0

for dir in $(echo "$@" | xargs -n1 dirname | sort -u | uniq); do
  echo "--> Running 'terraform stacks fmt' in directory '$dir'"
  pushd "$dir" >/dev/null
  terraform stacks fmt || VALIDATE_ERROR=$?
  popd >/dev/null
done

exit ${VALIDATE_ERROR}
