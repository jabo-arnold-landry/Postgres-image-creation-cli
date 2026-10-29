#!/bin/bash
# install.sh
echo "Installing create-img..."
INSTALL_DIR="/usr/local/bin"

# Download the script directly from GitHub raw content
sudo curl -sL https://raw.githubusercontent.com/jabo-arnold-landry/Postgres-image-creation-cli/main/create-img-o "$INSTALL_DIR/create-img"
sudo chmod +x "$INSTALL_DIR/create-img"

echo "Installation complete! You can now type 'create-img'."