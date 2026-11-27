#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
source ./core.lock
dest=".nextid-core"
if [[ -e "$dest" ]]; then
  echo "Core source already exists; verify it or move it aside before a reviewed refresh." >&2
  exit 1
fi
tmp="$(mktemp -d .nextid-core.tmp.XXXXXX)"
trap 'rm -rf -- "$tmp"' EXIT
git -C "$tmp" init -q
git -C "$tmp" remote add origin "$CORE_REPOSITORY"
git -C "$tmp" fetch --depth=1 --no-tags origin "$CORE_REVISION"
test "$(git -C "$tmp" rev-parse FETCH_HEAD)" = "$CORE_REVISION"
test "$(git -C "$tmp" rev-parse "FETCH_HEAD:$CORE_PATH")" = "$CORE_TREE"
mkdir "$tmp/source"
git -C "$tmp" archive "FETCH_HEAD:$CORE_PATH" | tar -xf - -C "$tmp/source"
mv "$tmp/source" "$dest"
# Source export is not a Git repository and contains no parent Git credentials.
printf '%s\n' "$CORE_REVISION $CORE_TREE" > "$dest/.nextid-source-lock"
echo "Verified and exported Keycloak $KEYCLOAK_VERSION from NextOpenSource."
