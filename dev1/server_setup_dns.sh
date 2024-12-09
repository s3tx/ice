#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install BIND9
echo "Installing BIND9..."
sudo apt install bind9 -y

# Backup existing configuration file
echo "Backing up existing configuration file..."
sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.bak

# Configure BIND9 options
echo "Configuring BIND9..."
sudo bash -c 'cat > /etc/bind/named.conf.options' <<EOF
options {
    directory "/var/cache/bind";

    // Forward queries to public DNS servers
    forwarders {
        1.1.1.1;  // First DNS
        1.0.0.1;  // Second DNS
    };

    allow-query { any; };          // Allow all clients to query
    dnssec-validation auto;        // Enable DNSSEC validation

    listen-on { any; };            // Listen on all IPv4 interfaces
};
EOF

# Restart and enable the named service
echo "Restarting and enabling named.service..."
sudo systemctl restart named
sudo systemctl enable named

echo "BIND9 installation and configuration complete!"
