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
