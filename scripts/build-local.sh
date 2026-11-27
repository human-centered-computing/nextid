#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
source ./core.lock
test -d .nextid-core
test "$(cat .nextid-core/.nextid-source-lock)" = "$CORE_REVISION $CORE_TREE"
docker build --build-arg KEYCLOAK_VERSION="$KEYCLOAK_VERSION" \
  --label "org.opencontainers.image.revision=$CORE_REVISION" \
  -f identity/nextid/Dockerfile.core -t "nextid-core:$KEYCLOAK_VERSION-local" .nextid-core
docker build --build-arg CORE_IMAGE="nextid-core:$KEYCLOAK_VERSION-local" \
  -f identity/nextid/Dockerfile -t "nextid:$KEYCLOAK_VERSION-local" .
