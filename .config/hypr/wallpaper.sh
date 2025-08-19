#!/bin/zsh

# Start swww daemon if not already running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 1
fi

WALLPAPER_DIR="$HOME/pix/wall"

# Pick a random image
IMG=$(ls "$WALLPAPER_DIR"/* | shuf -n 1)

# Set wallpaper with transition
swww img "$IMG" --transition-type any --transition-duration 1

