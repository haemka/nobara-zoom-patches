#!/bin/sh

ZOOM_VERSION=$(dnf info --installed zoom | awk -F': ' '/^Version/ { print $2 }')

[[ ! -d "${ZOOM_VERSION}" ]] && \
	echo "${ZOOM_VERSION} unsupported. Manual patching required." && \
	exit 1

[[ -f "/opt/zoom/zoom.orig" ]] && \
	echo "Backup file zoom.orig already exists. Remove and re run if you are sure, that the zoom binary patch isn't already applied." && \
       	exit 1

echo "Binary patching zoom"
mv /opt/zoom/zoom /opt/zoom/zoom.orig
bspatch /opt/zoom/zoom.orig /opt/zoom/zoom zoom.bspatch

echo Patching Zoom.desktop
cp /usr/share/applications/Zoom.desktop /usr/share/applications/Zoom.desktop.orig
patch < Zoom.desktop.patch
