#!/usr/bin/env bash

PID_FILE="$HOME/.local/share/wf-recorder-pid.txt"

# Check if the PID file exists
if [[ -f /tmp/wf-recorder-pid.txt ]]; then
  # Read the PID from the file and kill the process
  PID=$(cat "$PID_FILE")
  kill "$PID"
  notify-send "Recording stopped"
else
  notify-send "No active recording found."
fi
