#     ____             ____       _
#    / __ \____  ___  / __ \_____(_)   _____
#   / / / / __ \/ _ \/ / / / ___/ / | / / _ \
#  / /_/ / / / /  __/ /_/ / /  / /| |/ /  __/
#  \____/_/ /_/\___/_____/_/  /_/ |___/\___/

# Start OneDrive

rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive &
notify-send "OneDrive connected" "Microsoft OneDrive successfully mounted."