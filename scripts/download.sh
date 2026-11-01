#!/usr/bin/env sh

set -eu

install_macos() {
  echo "==> Installing packages for macOS"

  brew install \
    neovim \
    tree-sitter-cli
}

install_arch() {
  echo "==> Installing packages for Arch Linux"

  yay -S --needed --noconfirm --answerclean None --answerdiff None \
    neovim \
    tree-sitter-cli
}

case "$(uname -s)" in
  Darwin)
    install_macos
    ;;

  Linux)
    install_arch
    ;;

  *)
    echo "Unsupported operating system: $(uname -s)"
    exit 1
    ;;
esac

echo "==> Done"
