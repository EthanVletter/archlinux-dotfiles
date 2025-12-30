
#!/bin/bash
WAYPAPER_LINK="$HOME/.cache/ml4w/hyprland-dotfiles/current_wallpaper"
DST="/usr/share/sddm/themes/sanic/background"

# SRC=$(readlink -f "$WAYPAPER_LINK")
SRC=$(cat "$WAYPAPER_LINK")
[ -f "$SRC" ] && sudo cp "$SRC" "$DST"
