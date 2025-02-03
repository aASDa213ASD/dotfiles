#!/bin/sh
xrandr \
    --output DisplayPort-0 \
    --primary --mode 2560x1440 \
    --rate 240 --pos 0x0 \
    --rotate normal \
    --output DisplayPort-1 \
    --mode 1920x1080 \
    --rate 144 --pos -1920x0 \
    --rotate normal \
    --output HDMI-A-0 --off \
    --output HDMI-A-1 --off
