#!/bin/bash
set -e

NORX_DIR="$HOME/norx"
VENV_DIR="$NORX_DIR/venv"

if [ ! -d "$NORX_DIR" ]; then
    echo "Creating norx directory..."
    mkdir -p "$NORX_DIR"
else
    echo "Norx directory already exists."
fi

cd "$NORX_DIR" || exit

if [ ! -d "$VENV_DIR/bin" ]; then
    echo "Setting up virtual environment..."
    python3 -m venv "$VENV_DIR"
fi

echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

echo "Upgrading pip and setuptools..."
"$VENV_DIR/bin/pip" install --upgrade pip setuptools

echo "Installing required packages..."
"$VENV_DIR/bin/pip" install nornir nornir_netmiko pandas tqdm nornir_scrapli genie pyats

echo "Environment setup and package installation complete."
