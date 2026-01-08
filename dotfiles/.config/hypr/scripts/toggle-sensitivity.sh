#!/usr/bin/env bash

STATE="$HOME/.cache/sens_mode"

if [[ "$(cat "$STATE" 2>/dev/null)" == "low" ]]; then
    hyprctl keyword input:sensitivity 0.2
    # hyprctl keyword input:sensitivity 0
    hyprctl keyword input:accel_profile adaptive
    # hyprctl keyword input:accel_profile flat
    echo "high" > "$STATE"
    notify-send "Touchpad Mode" "Touchpad settings applied"
else
    hyprctl keyword input:sensitivity -0.3
    hyprctl keyword input:accel_profile flat
    echo "low" > "$STATE"
    notify-send "Mouse Mode" "Mouse settings applied"
fi



# #!/bin/bash

# # Check if Logitech G305 is connected
# if hyprctl devices | grep -q "logitech-g305-1"; then
#     # Apply mouse settings
#     hyprctl keyword input:sensitivity -0.3
#     hyprctl keyword input:accel_profile flat
#     notify-send "Mouse Mode" "Logitech G305 settings applied"
# else
#     # Apply touchpad settings
#     hyprctl keyword input:sensitivity 0
#     hyprctl keyword input:accel_profile adaptive
#     notify-send "Touchpad Mode" "Touchpad settings applied"
# fi