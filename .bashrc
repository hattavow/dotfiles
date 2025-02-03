#!/bin/bash
# Load the default .bashrc file.
if [ -f ~/.bashrc_default ]; then
    . ~/.bashrc_default
fi

# Load the .bashrc file customized by the user.
if [ -f ~/.bashrc_customization ]; then
    . ~/.bashrc_customization
fi

# Load the .bash aliases file.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load the .bash functions file.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
