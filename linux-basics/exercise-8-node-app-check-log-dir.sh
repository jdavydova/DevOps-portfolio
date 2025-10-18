#!/bin/bash

# ==========================================

# EXERCISE 8: Bash Script - Node App with Log Directory

# ==========================================

set -euo pipefail

read -p "Please write directory for logs: " LOG_DIR_INPUT

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret
export LOG_DIR="$(readlink -f "$LOG_DIR_INPUT")"

ARTIFACT_URL="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
ARTIFACT_NAME=$(basename "$ARTIFACT_URL")
LOG_FILE="$LOG_DIR/app.log" 

download() {
  if command -v curl >/dev/null 2>&1; then
    curl -fL -O "$ARTIFACT_URL"
  elif command -v wget >/dev/null 2>&1; then
    wget "$ARTIFACT_URL"
  else
    echo "Neither curl or wget is installed. Installing curl..."
    sudo apt update -y
    sudo apt install -y curl
    curl -O "$ARTIFACT_URL"
  fi
}

sudo apt update -y

sudo apt install -y nodejs npm

echo "Version of nodejs:" 
node -v
echo

echo "Version of npm:"
npm -v
echo

if [ ! -f "$ARTIFACT_NAME" ]; then
  echo " Downloading artifact: $ARTIFACT_URL"
  download
else
  echo " Artifact already exists: $ARTIFACT_NAME (skipping download)"
fi

echo "File downloaded: $ARTIFACT_NAME"
ls -lh "$ARTIFACT_NAME"

echo
echo "Extracting artifact..."
tar -xvzf "$ARTIFACT_NAME"

echo "Extraction complete!"
echo
echo "Contents:"
ls -1

PKG_DIR="$(tar -tzf "$ARTIFACT_NAME" | head -1 | cut -d/ -f1)"
if [ -z "${PKG_DIR:-}" ] || [ ! -d "$PKG_DIR" ]; then
  echo "[DEBUG]Could not determine extracted directory. Aborting."
  exit 1
fi

cd "$PKG_DIR"
npm install

# ============================
# Stop existing app on port 3000 (if running)
# ============================
if lsof -i :3000 >/dev/null 2>&1; then
  echo "Port 3000 is already in use. Stopping existing process..."
  OLD_PID=$(lsof -t -i :3000)
  kill "$OLD_PID" || true
  sleep 2
  echo "Old process $OLD_PID stopped."
fi

if [ ! -d $LOG_DIR ]
then
    echo "Logs directory doesn't exist. I will create $LOG_DIR directory."
    mkdir -p $LOG_DIR
else
   echo "Logs directory - $LOG_DIR exists"
fi

# ============================
# Start app
# ============================
nohup node server.js > $LOG_FILE 2>&1 &
APP_PID=$!
echo "Node app started in background (PID $APP_PID)"
echo "Logs: $LOG_FILE"

# ==========================================
# Check status
# ==========================================
echo "Checking if app started correctly..."
if ps -p "$APP_PID" > /dev/null
then
  echo " Node app is running (PID: $APP_PID)"
else
  echo "Node app failed to start!"
  echo "Check logs: $LOG_FILE)"
  exit 1
fi

echo "Check if port 3000 is listening"
sleep 2

if sudo lsof -i :3000 >/dev/null 2>&1
then
  echo "App is listening on port 3000"
else
  echo "App is NOT listening on port 3000"
  exit 1
fi

echo
echo "— Last 20 lines of app.log —"
tail -n 20 "$LOG_FILE" || true

echo
echo "Done. LOG_DIR: $LOG_DIR"

