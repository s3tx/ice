#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install packages
echo "Installing required packages..."
sudo apt install -y nmap curl python3.10-venv

echo "Installation completed successfully!"
