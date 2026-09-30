#!/usr/bin/env sh

set -eu

NVIM_CONFIG_DIR="$(cd "$(dirname "$0")" && pwd -P)"

echo "==> Installing packages"
sh "$NVIM_CONFIG_DIR/scripts/download.sh"

echo "==> Applying Neovim config"
sh "$NVIM_CONFIG_DIR/scripts/apply.sh"

echo "==> Done"

