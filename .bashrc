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
if [ -e /usr/bin/vim ]; then
    export EDITOR=/usr/bin/vim
fi

# Settings for pyenv.
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Settings for pipx.
if [ -e /usr/bin/pipx ]; then
    # Created by `pipx` on 2024-06-01 06:55:15
    # Modify default PATH added by pipx.
    export PATH="$PATH:$HOME/.local/bin"
fi

# Settings for golang.
if [ -x "/usr/local/go" ]; then
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$HOME/go/bin
fi

# Settings for linuxbrew.
if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Settings for Volta.
if [ -d "$HOME/.volta" ]; then
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
fi

# Settings for kubectl.
if [ -x "/usr/bin/kubectl" ]; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
fi

# Disable terminal IO lock.
stty stop undef
