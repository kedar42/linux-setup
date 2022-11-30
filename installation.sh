#!/bin/bash

error() { 
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

sudo pacman --noconfirm --needed -Syu || error "Error syncing the repos."

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru --gendb

#will not install things need to fix
paru --needed -Sy - < pkglist.txt || error "Failed to install aur packages"

# todo add steam to aurlist and somehow add preselected options
# Create .config if not present
[ ! -d ~/.config ] && mkdir ~/.config
# todo add auto clone for dotfiles

# add sddm activation
# todo add copy config
# todo modify pacman config to allow ILoveCandy Color Verbose and Paraller Downloads
# todo fix SDDM taking too long to close