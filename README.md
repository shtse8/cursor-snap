# Cursor IDE Snap Package

This repository contains the necessary configuration to build a Snap package for Cursor IDE.

![Auto Update Cursor Snap](https://github.com/shtse8/cursor-snap/workflows/Auto%20Update%20Cursor%20Snap/badge.svg)

Latest version: 0.47.4

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

Or install from the Snap Store:

```bash
sudo snap install cursor-ide
```

The snap is available in the Snap Store at: https://snapcraft.io/cursor-ide

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

## Publishing to Snap Store

This repository is configured to automatically publish new versions to the Snap Store. The process works as follows:

1. The `Auto Update Cursor Snap` workflow checks for new Cursor IDE versions and builds the snap package
2. The `Publish to Snap Store` workflow then publishes the built snap to the Snap Store

To set up Snap Store publishing:

1. Install snapcraft on a Linux machine (not in GitHub Actions for security):
   ```bash
   sudo snap install snapcraft --classic
   ```

2. Generate a Snap Store login file:
   ```bash
   snapcraft export-login --snaps cursor-ide --channels=stable snapcraft.login
   ```

3. Encode the login file to base64:
   ```bash
   cat snapcraft.login | base64 -w 0
   ```

4. Copy the encoded output

5. Add it as a repository secret:
   - Go to your repository settings
   - Click on "Secrets and variables" -> "Actions"
   - Click "New repository secret"
   - Name: `SNAPCRAFT_LOGIN_FILE`
   - Value: Paste the encoded login file value
   - Click "Add secret"

> **Security Note**: Never generate Snap Store credentials directly in GitHub Actions as the credentials could be exposed in logs.

## License

This snap packaging configuration is licensed under MIT License. Cursor IDE itself has its own licensing terms. 