#!/usr/bin/env bash

# Loop up to 5 times to wait for the network to initialize
for i in {1..5}; do
    # Fetch clean text variables from wttr.in using URL encoding
    # %c = condition icon, %t = temperature, %C = condition text, %f = feels like
    text=$(curl -s "https://wttr.in/paris\?format=%c%t\\n+Feels+like:+%f\\n+Wind:+%w\\n+Humidity:+%h")
    tooltip=$(curl -s "https://wttr.in/paris\?format=%c%t\\n+Feels+like:+%f\\n+Wind:+%w\\n+Humidity:+%h")

    # If the response isn't empty, break the loop
    if [ -n "$text" ] && [[ "$text" != *"Unknown"* ]] && [[ "$text" != *"Error"* ]]; then
        # Format a strict JSON output matching exactly what Waybar needs
        echo "$text"
        exit 0
    fi
    sleep 2
done

# Fail-safe state if internet or wttr.in is entirely unavailable
echo "--°C"

