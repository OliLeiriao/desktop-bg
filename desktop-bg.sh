#!/bin/bash

# 1. Define the folder path.
# $HOME is a shortcut for /home/yourusername (~/)
DIR="$HOME/Pictures/background"

# 2. Find all image files (jpg, png, jpeg), shuffle them, and pick the first one.
IMAGE_PATH=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

# 3. Check if an image was found before trying to set it.
if [ -z "$IMAGE_PATH" ]; then
    echo "No images found in $DIR"
    exit 1
fi

# 4. Set the background using gsettings. Must be a file URI (file:///).
# Sets both light and dark mode backgrounds for consistency.
gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE_PATH"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$IMAGE_PATH"
