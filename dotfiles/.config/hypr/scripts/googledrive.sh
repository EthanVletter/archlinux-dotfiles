#     ______                  __     ____       _
#    / ____/___  ____  ____ _/ /__  / __ \_____(_)   _____
#   / / __/ __ \/ __ \/ __ `/ / _ \/ / / / ___/ / | / / _ \
#  / /_/ / /_/ / /_/ / /_/ / /  __/ /_/ / /  / /| |/ /  __/
#  \____/\____/\____/\__, /_/\___/_____/_/  /_/ |___/\___/
#                   /____/

# Start GoogleDrive

# rclone --vfs-cache-mode writes mount GoogleDrive: ~/GoogleDrive &
# notify-send "GoogleDrive connected" "GoogleDrive successfully mounted."


REMOTE_NAME="GoogleDrive"
MOUNT_DIR="$HOME/GoogleDrive"

# Create mount directory if it doesn't exist
mkdir -p "$MOUNT_DIR"

notify-send "Google Drive" "Mounting Google Drive..."

# Kill any old mount first (if it exists)
if mountpoint -q "$MOUNT_DIR"; then
    fusermount -u "$MOUNT_DIR" 2>/dev/null || umount "$MOUNT_DIR" 2>/dev/null
    sleep 2
fi

# Mount with performance-focused flags
rclone mount "$REMOTE_NAME": "$MOUNT_DIR" \
--daemon \
--vfs-cache-mode full \
--vfs-cache-max-size 5G \
--dir-cache-time 72h \
--poll-interval 1m \
--buffer-size 256M \
--vfs-read-chunk-size 128M \
--vfs-read-chunk-size-limit 2G \
--transfers 8 \
--tpslimit 4 \
--log-file "$HOME/.local/share/rclone/gdrive.log" \
--log-level INFO

# Wait for mount to be ready (up to 20 seconds)
for i in {1..20}; do
    if mountpoint -q "$MOUNT_DIR"; then
        notify-send "Google Drive" "Mounted successfully."
        exit 0
    fi
    sleep 1
done

notify-send "Google Drive" "⚠️ Mount failed after 20s."
exit 1