#!/usr/bin/env bash  

# Get active window info and check if floating  
window_info=$(hyprctl activewindow -j)  
is_floating=$(echo "$window_info" | jq -r '.floating')  
  
# Get direction argument  
direction="$1"  
  
if [ "$is_floating" = "true" ]; then  
    # For floating windows, use moveactive with pixel values  
    case "$direction" in  
        "l"|"left")   hyprctl dispatch moveactive -100 0 ;;  
        "r"|"right")  hyprctl dispatch moveactive 100 0 ;;  
        "u"|"up")     hyprctl dispatch moveactive 0 -100 ;;  
        "d"|"down")   hyprctl dispatch moveactive 0 100 ;;  
        *)            echo "Usage: $0 {l|r|u|d}" ;;  
    esac  
else  
    # For tiled windows, use movewindow with direction  
    hyprctl dispatch movewindow "$direction"  
fi
