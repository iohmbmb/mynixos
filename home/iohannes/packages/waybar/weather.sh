#!/usr/bin/env bash

# Loop up to 5 times to wait for the network to initialize
for i in {1..5}; do
    # Fetch clean text variables from wttr.in using URL encoding
    # %c = condition icon, %t = temperature, %C = condition text, %f = feels like
    text=$(curl -s "https://wttr.in/paris")
    tooltip=$(curl -s "https://wttr.in/paris")

    # If the response isn't empty, break the loop
    if [ -n "$text" ] && [[ "$text" != *"Unknown"* ]] && [[ "$text" != *"Error"* ]]; then
        # Format a strict JSON output matching exactly what Waybar needs
        echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
        exit 0
    fi
    sleep 2
done

# Fail-safe state if internet or wttr.in is entirely unavailable
echo "{\"text\":\"   --°C\", \"tooltip\":\"Offline or Rate-Limited\"}"

