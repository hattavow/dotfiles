#!/bin/bash
function discord-update() {
    sudo apt autoremove discord --purge -y

    DISCORD_API_URL="https://discord.com/api/download?platform=linux&format=deb"
    wget -O ~/Downloads/discord-latest-version.deb "$DISCORD_API_URL"

    # Update Discord.
    sudo apt install ~/Downloads/discord-latest-version.deb -y
}
