#!/usr/bin/env bash

# --- Configuration ---
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/Landscape"

MONITORS=$(hyprctl monitors -j | jq -r '.[].name')  
MONITOR_ARRAY=($MONITORS)

# Get a list of image files
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \)))

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    notify-send "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Set a random wallpaper for each monitor
for MON in "${MONITOR_ARRAY[@]}"; do
    RAND_WP="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"
    notify-send "Setting wallpaper for $MON: $RAND_WP"
    swaybg -i "$RAND_WP" -o "$MON" -m fill
done

