#!/bin/bash

# Shell builtin

# External command
alias ls='ls --color=auto'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Docker CLI
alias dc='docker compose'
alias dcud='docker compose up --detach'
alias dcudb='docker compose up --detach --build'
alias dcd='docker compose down'
alias dce='docker compose exec'
alias dcp='docker compose ps'

# Neovim
alias nvimdiff='nvim -d'

# Kubectl
alias k='kubectl'
alias kas='kubectl api-resources'

# Git
alias g='git'

