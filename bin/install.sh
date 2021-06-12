#!/bin/bash

export BUILD_HARNESS_ORG=${1:-blockhenge}
export BUILD_HARNESS_PROJECT=${2:-build-harness}
export BUILD_HARNESS_BRANCH=${3:-main}
export GITHUB_REPO="https://github.com/${BUILD_HARNESS_ORG}/${BUILD_HARNESS_PROJECT}.git"

if [ "$BUILD_HARNESS_PROJECT" ] && [ -d "$BUILD_HARNESS_PROJECT" ]
then
  echo "Removing existing $BUILD_HARNESS_PROJECT"
  rm -rf "$BUILD_HARNESS_PROJECT"
fi

echo "Cloning ${GITHUB_REPO}#${BUILD_HARNESS_BRANCH}..."
git clone -c advice.detachedHead=false --depth=1 -b "$BUILD_HARNESS_BRANCH" "$GITHUB_REPO"

echo "Write .envrc if not present"
if [ ! -f .envrc ]
then
cat << EOF > .envrc
#!/usr/bin/env bash

# add ./build-harness/bin and ./build-harness/vendor to path
export PATH=./build-harness/bin:./build-harness/vendor:\$PATH
EOF
fi
