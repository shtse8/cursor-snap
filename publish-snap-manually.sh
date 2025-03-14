#!/bin/bash
set -e

# Script to manually download and publish the Cursor IDE snap package to the Snap Store
echo "Manual Snap Publishing Script"
echo "============================"

# Check if snapcraft is installed
if ! command -v snapcraft &> /dev/null; then
    echo "Installing snapcraft..."
    sudo snap install snapcraft --classic
fi

# Download the latest snap packages from GitHub releases
echo "Downloading latest snap packages from GitHub releases..."
REPO="shtse8/cursor-snap"
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$REPO/releases/latest")
ASSETS=$(echo "$LATEST_RELEASE" | grep -o '"browser_download_url": "[^"]*\.snap"' | sed 's/"browser_download_url": "//;s/"//')

if [ -z "$ASSETS" ]; then
    echo "No snap packages found in the latest release!"
    exit 1
fi

# Download each asset
for URL in $ASSETS; do
    echo "Downloading $URL..."
    curl -L -O "$URL"
done

# List downloaded snap files
echo "Downloaded snap files:"
ls -la *.snap

# Login to Snap Store
echo "Logging in to Snap Store..."
echo "Please follow the instructions to login to your Snap Store account."
snapcraft login

# Publish to Snap Store
echo "Publishing to Snap Store..."
for SNAP_FILE in *.snap; do
    if [ -f "$SNAP_FILE" ]; then
        echo "Publishing $SNAP_FILE to Snap Store..."
        snapcraft upload --release=stable "$SNAP_FILE"
    fi
done

echo "Done!" 