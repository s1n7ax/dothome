#!/bin/bash

# this file contains all the environment variables
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/share/s1n7ax/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:~/.local/share/flatpak/exports/bin
export PATH=$PATH:/var/lib/flatpak/exports/bin

export EDITOR=nvim

# this is required to run kdenlive appimage
export $(dbus-launch)
