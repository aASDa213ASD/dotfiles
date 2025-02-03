#!/bin/sh
xrandr \
    --output DisplayPort-1 \
    --set "scaling mode" "Full" \
    --mode 1920x1080 \
    --rate 144 --pos -1920x0 \
    --rotate normal \
    --output HDMI-A-0 --off \
    --output HDMI-A-1 --off \
    --output DisplayPort-0 --off

