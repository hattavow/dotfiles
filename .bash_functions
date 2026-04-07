#!/bin/bash
function discord-update() {
    sudo apt autoremove discord --purge -y

    DISCORD_API_URL="https://discord.com/api/download?platform=linux&format=deb"
    wget -O ~/Downloads/discord-latest-version.deb "$DISCORD_API_URL"

    # Update Discord.
    sudo apt install ~/Downloads/discord-latest-version.deb -y
}

# tmux split panes
function ts() {
    local session_name=${1:?"Usage: ts <session_name> [2|3|4]"}
    local panes=${2:-1}

    if [[ ! "$panes" =~ ^[1234]$ ]]; then
        echo "Error: panes must be 1, 2, 3, or 4" >&2
        return 1
    fi

    tmux new-session -d -s "$session_name"

    # Split the window into the specified number of panes
    local i
    for ((i = 1; i < panes; i++)); do
        tmux split-window -t "$session_name"
    done

    # Apply layout
    case "$panes" in
        2|3) tmux select-layout -t "$session_name" even-horizontal ;;
        4)   tmux select-layout -t "$session_name" tiled ;;
    esac

    # Select the first pane and attach
    tmux select-pane -t "$session_name:0.0"
    tmux attach-session -t "$session_name"
}
