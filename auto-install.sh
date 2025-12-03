#!/data/data/com.termux/files/usr/bin/bash
# Auto-install script for termux-url-opener and termux-file-editor dependencies
# This script installs all required packages for the media scripts to work

set -e

# Error handler function
handle_error() {
  local exit_code=$?
  echo ""
  echo "========================================"
  echo "ERROR: Installation failed!"
  echo "Exit code: $exit_code"
  echo "========================================"
  echo ""
  echo "Please check the error message above and try again."
  echo "You may need to:"
  echo "  - Check your internet connection"
  echo "  - Run 'pkg update' manually"
  echo "  - Clear package cache with 'pkg clean'"
  echo ""
  read -p "Press ENTER to exit..."
  exit $exit_code
}

# Set up error trap
trap 'handle_error' ERR

echo "======================================"
echo "Installing dependencies for Termux"
echo "media scripts (url-opener & file-editor)"
echo "======================================"
echo ""

# Update package lists
echo "[1/9] Updating package lists..."
if ! pkg update -y; then
  echo ""
  echo "ERROR: Failed to update package lists!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi

# Install termux-api (for termux-dialog, termux-toast, termux-media-scan)
echo ""
echo "[2/9] Installing termux-api..."
if ! pkg install -y termux-api; then
  echo ""
  echo "ERROR: Failed to install termux-api!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi
echo "Note: Make sure you also have the Termux:API app installed from F-Droid or Google Play"

# Install jq (JSON processor for parsing dialog output)
echo ""
echo "[3/9] Installing jq..."
if ! pkg install -y jq; then
  echo ""
  echo "ERROR: Failed to install jq!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi

# Install mpv (media player for listening in background)
echo ""
echo "[4/9] Installing mpv..."
if ! pkg install -y mpv; then
  echo ""
  echo "ERROR: Failed to install mpv!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi

# Install ffmpeg (for video compression and probing)
echo ""
echo "[5/9] Installing ffmpeg..."
if ! pkg install -y ffmpeg; then
  echo ""
  echo "ERROR: Failed to install ffmpeg!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi

# Install Python (required for yt-dlp)
echo ""
echo "[6/9] Installing Python..."
if ! pkg install -y python; then
  echo ""
  echo "ERROR: Failed to install Python!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi

# Install yt-dlp (YouTube downloader)
echo ""
echo "[7/9] Installing yt-dlp via pip..."
if ! pip install -U yt-dlp; then
  echo ""
  echo "ERROR: Failed to install yt-dlp!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi

# Install Node.js (required for GitHub Copilot CLI)
echo ""
echo "[8/9] Installing Node.js..."
if ! pkg install -y nodejs; then
  echo ""
  echo "ERROR: Failed to install Node.js!"
  echo ""
  read -p "Press ENTER to exit..."
  exit 1
fi

# Install GitHub Copilot CLI (for AI features)
echo ""
echo "[9/9] Installing GitHub Copilot CLI via npm..."
echo "Note: You will need to authenticate with GitHub after installation"
if ! npm install -g @githubnext/github-copilot-cli; then
  echo ""
  echo "ERROR: Failed to install GitHub Copilot CLI!"
  echo "You can install it manually later with:"
  echo "  npm install -g @githubnext/github-copilot-cli"
  echo ""
  read -p "Press ENTER to continue..."
fi

echo ""
echo "======================================"
echo "Installation complete!"
echo "======================================"
echo ""
echo "Installed packages:"
echo "  ✓ termux-api         (termux-dialog, termux-toast, termux-media-scan)"
echo "  ✓ jq                 (JSON parsing)"
echo "  ✓ mpv                (media player)"
echo "  ✓ ffmpeg             (video processing)"
echo "  ✓ python             (Python runtime)"
echo "  ✓ yt-dlp             (YouTube downloader)"
echo "  ✓ nodejs             (JavaScript runtime)"
echo "  ✓ github-copilot-cli (AI assistant)"
echo ""
echo "Additional setup required:"
echo "  1. Install Termux:API app from F-Droid or Google Play"
echo "  2. Run: termux-setup-storage"
echo "     (to grant storage permissions)"
echo "  3. Authenticate GitHub Copilot CLI:"
echo "     Run: github-copilot-cli auth"
echo "     (required for AI features in termux-file-editor)"
echo ""
echo "Your scripts should now work!"
echo "  - termux-url-opener (media download)"
echo "  - termux-file-editor (video compression + AI features)"
echo ""
