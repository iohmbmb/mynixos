#!/usr/bin/env bash

# --- Configuration ---
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/Landscape"

# Get all connected monitors from Hyprland
MONITORS=$(hyprctl monitors -j | jq -r '.[].name')  
MONITOR_ARRAY=($MONITORS)

# Find all image files
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \)))

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    notify-send "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# 1. Pick ONE random wallpaper for the entire session to prevent loops
RAND_WP="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

notify-send "Setting wallpaper: $(basename "$RAND_WP")"

# 2. Kill legacy swaybg instances right before launching the new ones
pkill swaybg

# 3. Apply that same wallpaper to all monitors
for MON in "${MONITOR_ARRAY[@]}"; do
    swaybg -i "$RAND_WP" -m fill -o "$MON" & 
done

# 4. Run your theme updates exactly ONCE
if [ -f "$RAND_WP" ]; then
    notify-send "Generating theme colors..."
    
    # Generate system colors from the wallpaper
    wallust run "$RAND_WP"
    
    # Force Firefox to catch up via Pywalfox
    pywalfox update

     # --- Reload Waybar to apply the new CSS colors ---
    pkill waybar
    waybar & disow
fi
