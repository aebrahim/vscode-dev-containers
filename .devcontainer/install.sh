#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# Install VS Code for use in desktop if needed
curl -sSL ${MICROSOFT_GPG_KEYS_URI} | gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
apt-get update
apt-get -y install code code-insiders

# Setup Fluxbox menus
mkdir -p /root/.fluxbox /home/node/.fluxbox
cp -f /tmp/fluxbox/* /root/.fluxbox/
cp -f /tmp/fluxbox/* /home/node/.fluxbox/
chown -R node:node /home/node/.fluxbox

# Install firefox
apt-get install -y firefox-esr
