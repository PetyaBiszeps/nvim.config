#!/usr/bin/env sh

set -eu

NVIM_CONFIG_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"
SRC="$NVIM_CONFIG_DIR/nvim"
DEST="$HOME/.config/nvim"

failed=0

check_command() {
  command="$1"

  if command -v "$command" >/dev/null 2>&1; then
    echo "OK: $command"
  else
    echo "FAIL: $command is not installed"
    failed=1
  fi
}

echo "==> Checking dependencies"

check_command nvim
check_command tree-sitter

echo
echo "==> Checking config"

if [ -d "$SRC" ]; then
  echo "OK: config exists: $SRC"
else
  echo "FAIL: config does not exist: $SRC"
  failed=1
fi

if [ -L "$DEST" ]; then
  target="$(readlink "$DEST")"

  if [ "$target" = "$SRC" ]; then
    echo "OK: $DEST -> $SRC"
  else
    echo "FAIL: wrong symlink"
    echo "      $DEST -> $target"
    echo "      expected -> $SRC"
    failed=1
  fi
else
  echo "FAIL: $DEST is not a symlink"
  failed=1
fi

echo

if [ "$failed" -eq 0 ]; then
  echo "==> Everything looks good"
else
  echo "==> Healthcheck failed"
  exit 1
fi

