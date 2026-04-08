#!/usr/bin/env bash

# Set the base directory for recordings (ScreenRecordings folder inside Videos)
OUTPUT_DIR="$HOME/Videos/ScreenRecordings"

# Ensure the directory exists
mkdir -p "$OUTPUT_DIR"

# Create a timestamp for the filename (e.g., screen_recording_20230408_141500.mp4)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="$OUTPUT_DIR/screen_recording_$TIMESTAMP.mp4"

# Get the name of the active (focused) monitor using the correct command
ACTIVE_MONITOR=$(hyprctl monitors | grep -B 12 "focused: yes" | head -n 1 | awk '{print $2}')

# If no active monitor is found, exit
if [[ -z "$ACTIVE_MONITOR" ]]; then
  echo "No active monitor found. Exiting."
  exit 1
fi

echo "Recording active monitor: $ACTIVE_MONITOR"

# Start the recording and save the PID to a file
wf-recorder --output "$ACTIVE_MONITOR" -f "$OUTPUT_FILE" &
notify-send "Recording started... Use the stop recording keybinding."
