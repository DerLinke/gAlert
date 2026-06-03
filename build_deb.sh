#!/bin/bash
# Build script for gAlert .deb package

set -e

VERSION="${1:-1.1.0}"
APP_NAME="galert"
MAINTAINER="Daniel Frey <https://github.com/DerLinke>"
DESCRIPTION="Freesound CLI Sound Installer for Linux"

ARCH=$(dpkg --print-architecture)
DEB_NAME="${APP_NAME}_${VERSION}_${ARCH}"
BUILD_DIR="dist/build_deb_temp"

echo "󰚌 Building $DEB_NAME..."

mkdir -p "$BUILD_DIR/DEBIAN"
mkdir -p "$BUILD_DIR/usr/bin"
mkdir -p "$BUILD_DIR/usr/share/doc/$APP_NAME"

# Create control file
cat <<EOF > "$BUILD_DIR/DEBIAN/control"
Package: $APP_NAME
Version: $VERSION
Section: utils
Priority: optional
Architecture: $ARCH
Maintainer: $MAINTAINER
Depends: python3, python3-requests, python3-rich, pulseaudio-utils | vorbis-tools
Description: $DESCRIPTION
EOF

# Install files
cp galert "$BUILD_DIR/usr/bin/galert"
chmod 755 "$BUILD_DIR/usr/bin/galert"
cp README.md LICENSE "$BUILD_DIR/usr/share/doc/$APP_NAME/"

# Build package
dpkg-deb --root-owner-group --build "$BUILD_DIR" "${DEB_NAME}.deb"
rm -rf "$BUILD_DIR"

echo "✅ Package created: ${DEB_NAME}.deb"
