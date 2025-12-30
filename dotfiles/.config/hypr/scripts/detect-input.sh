#!/bin/bash

# Check if Logitech G305 is connected
if hyprctl devices | grep -q "logitech-g305-1"; then
    # Apply mouse settings
    hyprctl keyword input:sensitivity -0.3
    hyprctl keyword input:accel_profile flat
    notify-send "Mouse Mode" "Logitech G305 settings applied"
else
    # Apply touchpad settings
    hyprctl keyword input:sensitivity 0
    hyprctl keyword input:accel_profile adaptive
    notify-send "Touchpad Mode" "Touchpad settings applied"
fi