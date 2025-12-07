#!/bin/bash

# Load the default .bashrc file.
if [ -f ~/.bashrc_default ]; then
    . ~/.bashrc_default
fi

# Load the .bash aliases file.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load the .bash functions file.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# System management.
export LC_TIME="en_US.UTF-8"

# Set default editor.
if command -v vim >/dev/null 2>&1; then
    export EDITOR=/usr/bin/vim
fi

# Settings for pipx.
# Created by `pipx` on 2024-06-01 06:55:15
# Modify default PATH added by pipx.
export PATH="$PATH:$HOME/.local/bin"

# Settings for golang.
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Settings for linuxbrew.
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Settings for pyenv.
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Settings for Volta.
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Settings for kubectl.
if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
fi

if command -v terraform >/dev/null 2>&1; then
    complete -C /usr/bin/terraform terraform
fi

# Disable terminal IO lock.
stty stop undef
