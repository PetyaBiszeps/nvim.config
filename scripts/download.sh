#!/usr/bin/env sh

set -eu

install_macos() {
  echo "==> Installing packages for macOS"

  brew install \
    neovim \
    tree-sitter-cli
}

case "$(uname -s)" in
  Darwin)
    install_macos
    ;;

  Linux)
    echo "Linux is not supported yet"
    exit 1
    ;;

  *)
    echo "Unsupported operating system: $(uname -s)"
    exit 1
    ;;
esac

echo "==> Done"

