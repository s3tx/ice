#!/bin/bash

# Define your proxy settings
HTTP_PROXY="http://10.0.156.105:8899"
HTTPS_PROXY="http://10.0.156.105:8899"
NO_PROXY="localhost,127.0.0.1,::1"

# Export proxy variables
export http_proxy="$HTTP_PROXY"
export https_proxy="$HTTPS_PROXY"
export no_proxy="$NO_PROXY"

# Add proxy settings to /etc/environment
echo "http_proxy=\"$HTTP_PROXY\"" | sudo tee -a /etc/environment
echo "https_proxy=\"$HTTPS_PROXY\"" | sudo tee -a /etc/environment
echo "no_proxy=\"$NO_PROXY\"" | sudo tee -a /etc/environment

# Add proxy settings to apt configuration
echo "Acquire::http::Proxy \"$HTTP_PROXY\";" | sudo tee /etc/apt/apt.conf.d/95proxies
echo "Acquire::https::Proxy \"$HTTPS_PROXY\";" | sudo tee -a /etc/apt/apt.conf.d/95proxies

echo "Proxy settings activated."
