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
    local panes=${1:?"Usage: ts <2|3|4> [session_name]"}
    local session_name="$2"

    if [[ ! "$panes" =~ ^[234]$ ]]; then
        echo "Error: panes must be 2, 3, or 4" >&2
        return 1
    fi

    local cmd=(tmux new-session -d)
    if [[ -n "$session_name" ]]; then
        cmd+=(-s "$session_name")
    fi
    "${cmd[@]}"

    # Get session name (for default case)
    if [[ -z "$session_name" ]]; then
        session_name=$(tmux display-message -p '#{session_name}')
    fi

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
