#!/usr/bin/env sh

set -eu

NVIM_CONFIG_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

SRC="$NVIM_CONFIG_DIR/nvim"
DEST="$HOME/.config/nvim"

if [ ! -d "$SRC" ]; then
  echo "Error: nvim config does not exist: $SRC"
  exit 1
fi

rm -rf "$DEST"

mkdir -p "$(dirname "$DEST")"
ln -s "$SRC" "$DEST"

echo "Linked: $DEST -> $SRC"

