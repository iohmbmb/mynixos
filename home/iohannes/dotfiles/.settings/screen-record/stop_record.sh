#!/usr/bin/env bash

# Check if the PID file exists
if [[ -f /tmp/wf-recorder-pid.txt ]]; then
  # Read the PID from the file and kill the process
  PID=$(cat /tmp/wf-recorder-pid.txt)
  kill "$PID"
  notify-send "Recording stopped"
else
  notify-send "No active recording found."
fi
