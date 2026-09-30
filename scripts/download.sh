#!/usr/bin/env sh

set -eu

install_macos() {
  echo "==> Installing packages for macOS"

  brew install \
    neovim \
    tree-sitter-cli
}

install_omarchy() {
  echo "==> Installing packages for Omarchy"

  omarchy pkg add \
    neovim \
    tree-sitter-cli
}

case "$(uname -s)" in
  Darwin)
    install_macos
    ;;

  Linux)
    if command -v omarchy >/dev/null 2>&1; then
      install_omarchy
    else
      echo "Unsupported Linux distribution"
      exit 1
    fi
    ;;

  *)
    echo "Unsupported operating system: $(uname -s)"
    exit 1
    ;;
esac

echo "==> Done"

