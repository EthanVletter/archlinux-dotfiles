for p in $(fastfetch --list-presets); do
    echo -e "\n===== $p =====\n"
    fastfetch -c $p
done
