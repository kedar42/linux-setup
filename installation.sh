#!/bin/bash

error() { 
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

sudo pacman --noconfirm --needed -Syu || error "Error syncing the repos."

sudo pacman --noconfirm --needed --ask 4 -Sy - < pkglist.txt || error "Failed to install pacman packages"
yay --needed -Sy - < aurlist.txt || error "Failed to install aur packages"

# todo add steam to aurlist and somehow add preselected options
# Create .config if not present
[ ! -d ~/.config ] && mkdir ~/.config
[ ! -d ~/.config ] && mkdir ~/Computer
# todo add auto clone for dotfiles
