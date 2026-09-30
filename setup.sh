#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BACKUP_ROOT="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link_file() {
    source_path=$1
    target_path=$2

    mkdir -p "$(dirname "$target_path")"
    if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
        printf 'already linked: %s\n' "$target_path"
        return
    fi
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        mkdir -p "$BACKUP_ROOT"
        mv "$target_path" "$BACKUP_ROOT/$(basename "$target_path")"
        printf 'backed up: %s -> %s\n' "$target_path" "$BACKUP_ROOT/$(basename "$target_path")"
    fi
    ln -s "$source_path" "$target_path"
    printf 'linked: %s -> %s\n' "$target_path" "$source_path"
}

link_file "$ROOT/.vimrc" "$HOME/.vimrc"
link_file "$ROOT/colors/one.vim" "$HOME/.vim/colors/one.vim"
link_file "$ROOT/fish/config.fish" "$HOME/.config/fish/config.fish"
link_file "$ROOT/nvim/init.vim" "$HOME/.config/nvim/init.vim"
link_file "$ROOT/colors/one.vim" "$HOME/.config/nvim/colors/one.vim"
link_file "$ROOT/ghostty/config" "$HOME/.config/ghostty/config"

printf '\nDone. Restart fish or open Vim, Neovim, or Ghostty to load the settings.\n'
