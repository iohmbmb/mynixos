#!/usr/bin/env bash

STATE_FILE="$XDG_RUNTIME_DIR/hypr-monitor.state"

# Get internal monitor name
get_internal() {
    hyprctl monitors -j | jq -r '.[] | select(.internal == true) | .name'
}

# Get first external monitor name
get_external() {
    hyprctl monitors -j | jq -r '.[] | select(.internal == false) | .name' | head -n1
}

# Apply automatic layout
auto_layout() {
    internal=$(get_internal)
    external=$(get_external)

    if [[ -z "$external" ]]; then
        echo "No external monitor — enabling internal only"
        hyprctl keyword monitor "$internal,preferred,auto,1"
        rm -f "$STATE_FILE"
    else
        echo "External monitor detected: $external"
        hyprctl keyword monitor "$internal,preferred,auto,1"
        hyprctl keyword monitor "$external,preferred,auto,1"
    fi
}

# Toggle mirror / extend
toggle_mirror() {
    internal=$(get_internal)
    external=$(get_external)

    [[ -z "$external" ]] && exit 0

    if [[ ! -f "$STATE_FILE" || "$(cat "$STATE_FILE")" == "extend" ]]; then
        echo "Switching to MIRROR"
        hyprctl keyword monitor "$external,preferred,0x0,1,mirror,$internal"
        echo "mirror" > "$STATE_FILE"
    else
        echo "Switching to EXTEND"
        hyprctl keyword monitor "$internal,preferred,0x0,1"
        hyprctl keyword monitor "$external,preferred,auto,1"
        echo "extend" > "$STATE_FILE"
    fi
}

# Entry point
case "$1" in
    toggle)
        toggle_mirror
        ;;
    *)
        auto_layout
        ;;
esac

