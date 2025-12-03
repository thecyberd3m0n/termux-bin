#!/data/data/com.termux/files/usr/bin/bash
# Auto-install script for termux-url-opener and termux-file-editor dependencies
# This script installs all required packages for the media scripts to work

set -e

echo "======================================"
echo "Installing dependencies for Termux"
echo "media scripts (url-opener & file-editor)"
echo "======================================"
echo ""

# Update package lists
echo "[1/7] Updating package lists..."
pkg update -y

# Install termux-api (for termux-dialog, termux-toast, termux-media-scan)
echo ""
echo "[2/7] Installing termux-api..."
pkg install -y termux-api
echo "Note: Make sure you also have the Termux:API app installed from F-Droid or Google Play"

# Install jq (JSON processor for parsing dialog output)
echo ""
echo "[3/7] Installing jq..."
pkg install -y jq

# Install mpv (media player for listening in background)
echo ""
echo "[4/7] Installing mpv..."
pkg install -y mpv

# Install ffmpeg (for video compression and probing)
echo ""
echo "[5/7] Installing ffmpeg..."
pkg install -y ffmpeg

# Install Python (required for yt-dlp)
echo ""
echo "[6/7] Installing Python..."
pkg install -y python

# Install yt-dlp (YouTube downloader)
echo ""
echo "[7/7] Installing yt-dlp via pip..."
pip install -U yt-dlp

echo ""
echo "======================================"
echo "Installation complete!"
echo "======================================"
echo ""
echo "Installed packages:"
echo "  ✓ termux-api     (termux-dialog, termux-toast, termux-media-scan)"
echo "  ✓ jq             (JSON parsing)"
echo "  ✓ mpv            (media player)"
echo "  ✓ ffmpeg         (video processing)"
echo "  ✓ python         (Python runtime)"
echo "  ✓ yt-dlp         (YouTube downloader)"
echo ""
echo "Additional setup required:"
echo "  1. Install Termux:API app from F-Droid or Google Play"
echo "  2. Run: termux-setup-storage"
echo "     (to grant storage permissions)"
echo ""
echo "Your scripts should now work!"
echo "  - termux-url-opener (media download)"
echo "  - termux-file-editor (video compression)"
echo ""
