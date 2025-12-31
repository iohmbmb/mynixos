#!/bin/bash

# Function to handle screen connection/disconnection
handle_screen_event() {
    local event="$1"
    
    # Print event
    echo "Event: $event"

    # Query the current output status using xrandr
    if [[ "$event" == "connected" ]]; then
        echo "Screen connected:"
        xrandr --listmonitors
    elif [[ "$event" == "disconnected" ]]; then
        echo "Screen disconnected"
    fi
}

# Monitor events on /sys/class/drm/ for changes (detects hotplug events)
inotifywait -m -e modify /sys/class/drm/ | while read -r event; do
    # Check if the event corresponds to a screen being connected or disconnected
    if [[ "$event" =~ "eDP" || "$event" =~ "HDMI" || "$event" =~ "DP" ]]; then
        # Detecting specific changes for HDMI, DP, eDP output events (you can add more outputs if needed)
        if [[ "$(cat /sys/class/drm/*/status)" == "connected" ]]; then
            handle_screen_event "connected"
        else
            handle_screen_event "disconnected"
        fi
    fi
done

