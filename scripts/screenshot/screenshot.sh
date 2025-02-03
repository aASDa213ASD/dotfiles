#! /bin/bash

# Script for taking pretty screenshots on XOrg desktop environments.
# Requires: maim & imagemagick & xclip to be installed.

# Pipefail will make script exit if any command fails
set -o pipefail

# Protection
BYTES_SIZE_LIMIT=1000000

# Directory
SCREENSHOTS_DIRECTORY=$HOME/Pictures/Screenshots

# Image settings
# Round border in pixels
BORDER_RADIUS=10
# (Weight x Radius) + (Horizontal offset x Vertical offset)
SHADOW_SIZE="80x10+0x0"

function check_directories()
{
    # Check if output directory exists, create if not
    if [ ! -d "$SCREENSHOTS_DIRECTORY" ]; then
        mkdir -p "$SCREENSHOTS_DIRECTORY"
    fi
}

function main()
{
    check_directories

    timestamp=$(date +"%d-%m-%Y-%H%M%S")
    original_screenshot_file="$SCREENSHOTS_DIRECTORY/original_$timestamp.png"
    screenshot_file="$SCREENSHOTS_DIRECTORY/$timestamp.png"

    if [ "$1" == 'full' ]; then
        maim --hidecursor "$original_screenshot_file"
    elif [ "$1" == 'area' ]; then
        maim --hidecursor -s "$original_screenshot_file"
    else
        exit 1
    fi

    # Use imagemagick to add round corners and drop shadow
    convert "$original_screenshot_file" \
    \( +clone -alpha extract -draw "fill black polygon 0,0 0,$BORDER_RADIUS $BORDER_RADIUS,0 fill white circle $BORDER_RADIUS,$BORDER_RADIUS $BORDER_RADIUS,0" \
    \( +clone -flip \) -compose Multiply -composite \
    \( +clone -flop \) -compose Multiply -composite \
    \) -alpha off -compose CopyOpacity -composite -compose over \
    \( +clone -background black -shadow "$SHADOW_SIZE" \) +swap -background none -layers merge +repage "$screenshot_file"

    # Ensure the size is not large enough to crash our whole clipboard
    raw_image_size=$(stat -c%s "$screenshot_file")
    if ((raw_image_size > BYTES_SIZE_LIMIT)); then
        notify-send -a Screenshot -u low -t 3000 "Screenshot" "Compressing"
        magick convert "$screenshot_file" -strip -interlace Plane webp:"$screenshot_file"
    fi

    xclip -in -selection clipboard -target image/png "$screenshot_file"
    rm "$original_screenshot_file" && rm "$screenshot_file"

    notify-send -a Screenshot -u low -t 3000 "Screenshot" "Copied"
}

if [ "$#" -gt 0 ]; then
    main "$@"
fi
