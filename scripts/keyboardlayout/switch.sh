#!/bin/bash

# This script is designed to switch keyboard layouts
# To get the list of all possible layouts use:
# > localectl list-x11-keymap-layouts

# Array of keyboard layouts, feel free to add those you need
layouts=(
    us ru ua
)

# Get the current keyboard layout
current_layout=$(setxkbmap -query | grep -oP 'layout:\s*\K\w+')

# Find the index of the current layout in the array
for i in "${!layouts[@]}"; do
    if [[ "${layouts[$i]}" == "$current_layout" ]]; then
        current_index=$i
        break
    fi
done

# Calculate the next index (loop back to 0 if at the end of the array)
next_layout=$(((current_index + 1) % ${#layouts[@]}))

# Switch to the next layout
setxkbmap "${layouts[$next_layout]}"
