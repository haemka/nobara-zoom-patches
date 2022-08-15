# Nobara Linux binary patches for Zoom meeting software

This repository contains patches for the Zoom meeting software, to allow screen sharing on Nobara Linux with any desktop environment.

## Rationale

Zoom restricts screen sharing on Wayland to a few "supported" operating systems and GNOME desktop environments. Those operating systems are hardcoded within the Zoom binary. The patches contained in this repository are intended to patch the binary file by replacing any string occurence of "fedora" into "nobara". Futhermore the .desktop-file gets patched in order to run Zoom with the environment variable XDG_CURRENT_DESKTOP set to GNOME (instead whatever is running).

These patches work for me on Nobara 36 with KDE.

# WARNING

Binary patches are potentially dangerous. Only use this if you know what you are doing.

## Installation

Just run the supplied `patch.sh`.

## Supported Zoom versions

Due to the nature of binary patches, each version of Zoom will probably need their own patches. Each supported version has it's own sub directory with patched within this repository. The `patch.sh` script will check the zoom packages version via dnf and check if a corresponding patch directory exists.

The pathes are created via manual patching in a hex editor.

