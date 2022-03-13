#!/bin/bash

export PATH=$PATH:/var/lib/flatpak/exports/bin
export PATH=$PATH:~/.s1n7ax/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin

export EDITOR=nvim
export TERM=st

# need this for idea IDE to work correctly on dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# Davinci Resolve
# To enable compatibility with high-resolution displays, set the following environment variables accordingly
export QT_DEVICE_PIXEL_RATIO=1.5
export QT_AUTO_SCREEN_SCALE_FACTOR=true
