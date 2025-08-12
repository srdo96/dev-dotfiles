#!/bin/bash

LAPTOP="eDP-1"
EXTERNAL="HDMI-A-1"

# Check if external monitor is connected
if hyprctl monitors | grep -q "$EXTERNAL"; then
    # Move workspace 1 to external
    hyprctl dispatch moveworkspace 1 "$EXTERNAL"
    # Move workspace 5 to laptop
    hyprctl dispatch moveworkspace 5 "$LAPTOP"
fi

