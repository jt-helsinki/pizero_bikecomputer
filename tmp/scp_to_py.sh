#!/bin/bash

# Target directory on the Pi
TARGET_DIR="pizero:~/pizero_bikecomputer"

# Source directory (relative to script)
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files and directories to copy
FILES_AND_DIRS=(
  "../scripts"
  "../modules"
  "../menus.yaml"
  "../settings.cnf"
  "../layout.yaml"
)

# Exclude patterns
EXCLUDES=(
  "--exclude=*.pyc"
  "--exclude=*.c"
  "--exclude=*.h"
  "--exclude=*.pyxbld"
  "--exclude=*.pyx"
)

echo "📦 Syncing files to $TARGET_DIR (excluding certain file types)..."

for item in "${FILES_AND_DIRS[@]}"; do
    full_path="$SRC_DIR/$item"
    echo "🔄 Syncing $full_path..."
    rsync -av "${EXCLUDES[@]}" "$full_path" "$TARGET_DIR"
done

echo "✅ Done."