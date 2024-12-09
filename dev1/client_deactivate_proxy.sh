#!/bin/bash

# Unset proxy variables
unset http_proxy
unset https_proxy
unset no_proxy

# Remove proxy settings from /etc/environment
sudo sed -i '/http_proxy/d' /etc/environment
sudo sed -i '/https_proxy/d' /etc/environment
sudo sed -i '/no_proxy/d' /etc/environment

# Remove proxy settings from apt configuration
sudo rm -f /etc/apt/apt.conf.d/95proxies

echo "Proxy settings deactivated."
