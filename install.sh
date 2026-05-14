#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing dotfiles..."

if ! command -v stow &> /dev/null; then
    echo "==> GNU Stow not found. Installing..."
    if command -v brew &> /dev/null; then
        brew install stow
    elif command -v apt-get &> /dev/null; then
        sudo apt-get install -y stow
    elif command -v yum &> /dev/null; then
        sudo yum install -y stow
    else
        echo "Error: Could not install stow. Please install it manually."
        exit 1
    fi
fi

echo "==> Removing existing config files to avoid conflicts..."
rm -rf "$HOME/.config/nvim"
rm -f "$HOME/.tmux.conf"

echo "==> Creating symlinks with Stow..."
cd "$DOTFILES_DIR"
stow -v -t ~ nvim tmux

echo "==> Done! Dotfiles are now linked."
echo ""
echo "Note: You may need to install Neovim plugins by running :Lazy inside Neovim."
