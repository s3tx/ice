#!/bin/bash

# Define variables
PROXY_DIR="$HOME/proxy"
VENV_DIR="$PROXY_DIR/venv"
HOSTNAME="10.0.156.105"

# Check if the proxy directory exists
if [ ! -d "$PROXY_DIR" ]; then
    echo "Creating proxy directory..."
    mkdir -p "$PROXY_DIR"
else
    echo "Proxy directory already exists."
fi

# Navigate to the proxy directory
cd "$PROXY_DIR" || exit

# Check if the virtual environment exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Setting up virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# Upgrade pip and setuptools
echo "Upgrading pip and setuptools..."
"$VENV_DIR/bin/pip" install --upgrade pip setuptools

# Install proxy.py
echo "Installing proxy.py..."
"$VENV_DIR/bin/pip" install proxy.py

# Start the proxy server
echo "Starting proxy server on hostname $HOSTNAME..."
"$VENV_DIR/bin/proxy" --hostname "$HOSTNAME"
