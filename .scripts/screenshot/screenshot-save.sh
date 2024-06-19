#! /bin/bash

# Script for saving image from clipboard
# Requires: xclip to be installed.

# Directory
SCREENSHOTS_DIRECTORY=$HOME/Pictures/Screenshots

# Check if output directory exists, create if not
if [ ! -d "$SCREENSHOTS_DIRECTORY" ]; then
    mkdir -p "$SCREENSHOTS_DIRECTORY"
fi

timestamp=$(date +"%d-%m-%Y-%H%M%S")
screenshot_file="$SCREENSHOTS_DIRECTORY/$timestamp.png"

# Check if the clipboard contains image data
if xclip -selection clipboard -t TARGETS -o | grep -iq png; then
    # Save the current clipboard content to a file
    xclip -selection clipboard -t image/png -o > "$screenshot_file"
    notify-send -a Screenshot -u low -t 3000 "Screenshot" "File saved."
fi