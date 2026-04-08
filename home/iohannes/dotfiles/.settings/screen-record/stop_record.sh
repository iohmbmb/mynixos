#!/usr/bin/env bash

# Find the PID of the running wf-recorder process
PID=$(pgrep -x "wf-recorder")

# Check if we found a PID
if [[ -z "$PID" ]]; then
  # Kill the wf-recorder process
  kill "$PID" && notify-send "Recording stopped."
else
  echo "No active recording found. Could not find wf-recorder PID."
fi
