#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

DOTFILES_ROOT=$(pwd -P)
echo "DOTFILES_ROOT: $DOTFILES_ROOT"

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    info "File already exists: $dst ($(basename "$src"))"

    # do not link file if already linked
    local currentdst="$(readlink $dst)"
    if [ "$currentdst" == "$src" ]
    then
      info "already linked to $src"
      return
    fi

    mv "$dst" "${dst}.backup"
    success "moved $dst to ${dst}.backup"
  fi

  ln -s "$1" "$2"
  success "linked $1 to $2"
}

install_zsh() {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Install Oh My Zsh if it isn't already present
    if [[ ! -d "$HOME/.oh-my-zsh/" ]]; then
      info "installing oh-my-zsh"
      curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    fi

    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      info "setting default shell to zsh"
      chsh -s $(which zsh)
    fi
  else
    # install zsh
    sudo apt-get install zsh
    fail "zsh not installed"
  fi
}

link_file "$DOTFILES_ROOT/shell" "$HOME/.config/shell"
link_file "$DOTFILES_ROOT/shell/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_ROOT/shell/.bash_logout" "$HOME/.bash_logout"

link_file "$DOTFILES_ROOT/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_ROOT/tmux/tmux.conf" "$HOME/.tmux.conf"
