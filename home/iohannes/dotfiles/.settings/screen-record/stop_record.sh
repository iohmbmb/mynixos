#!/usr/bin/env bash

# Find the PID of the running wf-recorder process
PID=$(pgrep -x "wf-recorder")

notify-send "Recording stopped."
# Check if we found a PID
if [[ -z "$PID" ]]; then
  # Kill the wf-recorder process
  killall -34 wf-recorder
else
  echo "No active recording found. Could not find wf-recorder PID."
fi
