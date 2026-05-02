#!/bin/bash

########
# nvim #
########
if command -v nvim >/dev/null 2>&1; then
    mkdir -p "$XDG_CONFIG_HOME/nvim"
    mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

    ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"

    # install neovim plugin manager
    [ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
        && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
    ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

    # Install (or update) all the plugins
    nvim --noplugin +PlugUpdate +qa
fi

#######
# X11 #
#######
if command -v xorg >/dev/null 2>&1; then
    rm -rf "$XDG_CONFIG_HOME/X11"
    ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"
fi


######
# i3 #
######
if command -v i3 >/dev/null 2>&1; then
    rm -rf "$XDG_CONFIG_HOME/i3"
    ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"
fi

#######
# Zsh #
#######
if command -v zsh >/dev/null 2>&1; then
    mkdir -p "$XDG_CONFIG_HOME/zsh"
    ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
    ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
    ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
    rm -rf "$XDG_CONFIG_HOME/zsh/external"
    ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"
fi

#########
# Fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#########
# dunst #
#########
if command -v dunst >/dev/null 2>&1; then
    mkdir -p "$XDG_CONFIG_HOME/dunst"
    ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"
fi

########
# tmux #
########
if command -v tmux >/dev/null 2>&1; then
    mkdir -p "$XDG_CONFIG_HOME/tmux"
    ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

    [ ! -d "$XDG_CONFIG_HOME/tmux/plugins" ] \
    && git clone https://github.com/tmux-plugins/tpm \
    "$XDG_CONFIG_HOME/tmux/plugins/tpm"
fi

