# Cursor IDE Snap Package

This repository contains the necessary configuration to build a Snap package for Cursor IDE.

![Auto Update Cursor Snap](https://github.com/shtse8/cursor-snap/workflows/Auto%20Update%20Cursor%20Snap/badge.svg)

Latest version: (auto-updated)

## Automatic Updates

This repository automatically checks for new Cursor IDE releases every hour and builds a new snap package when updates are available. You can find the latest builds in the [Releases](https://github.com/shtse8/cursor-snap/releases) section.

### Supported Platforms
- linux-x64 (64-bit x86)
- linux-arm64 (64-bit ARM)

## Building the Snap

To build the snap package locally:

1. Install snapcraft:
```bash
sudo snap install snapcraft --classic
```

2. Clone this repository:
```bash
git clone https://github.com/shtse8/cursor-snap.git
cd cursor-snap
```

3. Build the snap:
```bash
snapcraft
```

## Installing the Snap

Once built, you can install the snap locally with:

```bash
sudo snap install cursor-ide_*.snap --dangerous
```

Or install from the Snap Store (once published):

```bash
sudo snap install cursor-ide
```

## Features

- AI-powered code completion
- Smart code refactoring
- Integrated debugging tools
- Modern UI/UX
- Multi-language support
- Automatic hourly updates via GitHub Actions

## Permissions

The snap package requires the following permissions:
- Home directory access
- Network access
- Display server access
- Audio playback
- Browser support

## Support

For issues related to the snap package, please file them in this repository's issue tracker.
For Cursor IDE specific issues, please visit [Cursor's official repository](https://github.com/getcursor/cursor).

## License

This snap packaging configuration is licensed under MIT License. Cursor IDE itself has its own licensing terms. 