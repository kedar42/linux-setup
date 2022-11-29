#!/bin/bash

error() { 
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

sudo pacman --noconfirm --needed -Syu || error "Error syncing the repos."

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

#will not install things need to fix
paru --needed -Sy - < pkglist.txt || error "Failed to install aur packages"

# todo add steam to aurlist and somehow add preselected options
# Create .config if not present
[ ! -d ~/.config ] && mkdir ~/.config
# todo add auto clone for dotfiles

# add sddm activation
#todo add copy config