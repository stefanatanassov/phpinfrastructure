#!/bin/bash
set -e

TARGET_DIR="/var/www/app"
TEMP_DIR="/tmp/skeleton"

# Create project in a temporary location
rm -rf "$TEMP_DIR"
composer create-project symfony/skeleton "$TEMP_DIR"

# Copy generated files into the working directory
cp -R "$TEMP_DIR"/. "$TARGET_DIR"

# Cleanup temporary directory
rm -rf "$TEMP_DIR"
