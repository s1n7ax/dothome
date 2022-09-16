#!/bin/bash

#------------------------------------------------------------------------------#
#                                 APPLICATIONS                                 #
#------------------------------------------------------------------------------#
alias f="vifmrun"
alias n="nvim"
alias p="sudo pacman -Sy && sudo pacman -S"
alias pl="pacman -Ql"
alias lg="lazygit"
alias ld="lazydocker"

# pacman stuff
alias p="sudo pacman -S --needed"
alias pu="sudo pacman -Sy"
alias puu="sudo pacman -Syu"
alias pr="sudo pacman -Ru"
alias pl="pacman -Ql"

# Other
alias yt="yt-dlp"

# Kubernetes
alias k="kubectl"
alias ka="kubectl get all"

alias kp="kubectl get pods"
alias kr="kubectl get rs"
alias kd="kubectl get deployments"
alias ks="kubectl get services"

alias kc="kubectl create -f"

alias kdp="kubectl delete pod"
alias kdr="kubectl delete rs"
alias kdd="kubectl delete deployment"
alias kds="kubectl delete service"

alias kdsp="kubectl describe pod"
alias kdsr="kubectl describe rs"
alias kdsd="kubectl describe deployment"
alias kdss="kubectl describe service"

# Docker compose
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcrm="docker-compose rm"
alias dci="docker-compose images"

#------------------------------------------------------------------------------#
#                                   LOCATIONS                                  #
#------------------------------------------------------------------------------#
alias el="cd ~/.s1n7ax && nvim"

alias lv="cd ~/.config/nvim && lazygit"
alias ev="cd ~/.config/nvim && nvim"

alias cdw="cd ~/Workspace"
alias cdn="cd ~/Workspace/nvim/"
