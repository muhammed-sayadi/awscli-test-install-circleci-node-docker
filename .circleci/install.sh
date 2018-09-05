#!/usr/bin/env bash

##################
# Install AWS CLI
##################

# Setup pip first
sudo apt-get install -y libpython-dev

# Download awscli bundle
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

# Unzip the downloaded bundle
unzip awscli-bundle.zip

# Run the install script and install to ~/bin/aws directory
./awscli-bundle/install -b ~/bin/aws
