# Cursor IDE Snap Package

This repository contains the necessary configuration to build a Snap package for Cursor IDE.

![Auto Update Cursor Snap](https://github.com/shtse8/cursor-snap/workflows/Auto%20Update%20Cursor%20Snap/badge.svg)

Latest version: 0.48.6

## Automatic Updates

This repository automatically checks for new Cursor IDE releases every hour and builds a new snap package when updates are available. You can find the latest builds in the [Releases](https://github.com/shtse8/cursor-snap/releases) section.

The update process is fully automated and works as follows:
1. Check for new versions of Cursor IDE
2. If a new version is found, build snap packages for both x64 and arm64 platforms
3. Create GitHub releases with the snap packages
4. Update this README with the latest version
5. Publish the snap packages to the Snap Store

You can also manually trigger a rebuild and publish by:
1. Going to the Actions tab in this repository
2. Selecting the "Auto Update Cursor Snap" workflow
3. Clicking "Run workflow"
4. Setting "Force rebuild regardless of version checks" to "true"
5. Clicking "Run workflow"

This is useful if the Snap Store publication failed but the README was updated, or if you want to force a rebuild for any other reason.

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

To set up Snap Store publishing securely:

1. Install snapcraft on a Linux machine (not in GitHub Actions for security):
   ```bash
   sudo snap install snapcraft --classic
   ```

2. Generate a Snap Store login file:
   ```bash
   snapcraft export-login snapcraft.login
   ```

3. Encode the login file to base64 (use the -w0 flag to avoid line breaks):
   ```bash
   base64 -w 0 snapcraft.login > snapcraft.login.base64
   ```

4. Copy the encoded output from the file (don't print it to terminal):
   ```bash
   cat snapcraft.login.base64
   ```

5. Add it as a repository secret:
   - Go to your repository settings
   - Click on "Secrets and variables" -> "Actions"
   - Click "New repository secret"
   - Name: `SNAPCRAFT_LOGIN_FILE`
   - Value: Paste the encoded login file value
   - Click "Add secret"

6. Securely delete the credential files from your local machine:
   ```bash
   shred -u snapcraft.login snapcraft.login.base64
   ```

> **IMPORTANT SECURITY NOTES**: 
> - Never generate Snap Store credentials directly in GitHub Actions
> - Never echo or print credentials in workflow commands
> - Credentials should never appear in logs
> - Regularly rotate your Snap Store credentials
> - If credentials are ever exposed, revoke them immediately and generate new ones

## Workflow Architecture

The GitHub Actions workflows in this repository are designed to be simple, reliable, and efficient:

1. **Check Version Job**: Checks if there's a new version of Cursor IDE available
   - Compares against both the README version and the Snap Store version
   - Ensures updates are triggered if either is out of date
2. **Build and Release Job**: Builds snap packages for both platforms and creates GitHub releases
3. **Update README Job**: Updates this README with the latest version information
4. **Publish to Snap Store Workflow**: Publishes the snap packages to the Snap Store

This architecture ensures that:
- We only build when there's a new version available
- The Snap Store always has the latest version, even if the README is already updated
- Each step is clearly separated and has a single responsibility
- The process is reliable and avoids race conditions

## License

This snap packaging configuration is licensed under MIT License. Cursor IDE itself has its own licensing terms. 