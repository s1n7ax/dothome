#!/usr/bin/env nu

#------------------------------------------------------------------------------#
#                                 APPLICATIONS                                 #
#------------------------------------------------------------------------------#
alias f = vifmrun
alias n = nvim
alias p = sudo pacman -Sy && sudo pacman -S
alias pl = pacman -Ql
alias lg = lazygit
alias ld = lazydocker
alias yt = yt-dlp

# pacman stuff
alias p = sudo pacman -S --needed
alias pu = sudo pacman -Sy
alias puu = sudo pacman -Syu
alias pr = sudo pacman -Ru
alias pl = pacman -Ql

# Other
alias yt = yt-dlp


#------------------------------------------------------------------------------#
#                                   LOCATIONS                                  #
#------------------------------------------------------------------------------#
alias eloc = cd ~/.s1n7ax && nvim

alias lvim = cd ~/.config/nvim && lazygit
alias evim = cd ~/.config/nvim && nvim

alias cdw = cd ~/Workspace
alias cdn = cd ~/Workspace/nvim/
