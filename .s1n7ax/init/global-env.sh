#!/bin/bash

PATH=$PATH:/var/lib/flatpak/exports/bin
PATH=$PATH:~/.s1n7ax/bin
PATH=$PATH:~/.yarn/bin
PATH=$PATH:~/.local/bin
PATH=$PATH:~/.cargo/bin
export PATH

export EDITOR=nvim
export TERM=st

# need this for idea IDE to work correctly on dwm
export _JAVA_AWT_WM_NONREPARENTING=1
