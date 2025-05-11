#!/bin/bash
set -eux

APPIMAGE_EXTRACT_AND_RUN=1 ./linuxdeploy.AppImage --appdir AppDir --output appimage

mkdir -p output
mv Luanti*.AppImage "output/Luanti-$LATEST_VERSION.AppImage"