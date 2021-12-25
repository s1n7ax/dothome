#!/bin/bash

# this file contains all the environment variables
export PATH=$PATH:/var/lib/flatpak/exports/bin
export PATH=$PATH:~/.s1n7ax/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin

export EDITOR=nvim
export TERM=st

export _JAVA_AWT_WM_NONREPARENTING=1

eval $(luarocks path)

