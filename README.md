# homebrew-drm3

Homebrew tap for installing MOR on macOS and Linux.

## Install

### Desktop App (macOS — recommended)

Installs the MOR desktop app + `mor` CLI in one command. No Gatekeeper warnings.

```bash
brew tap drm3labs/drm3
brew install --cask mor
```

This gives you:
- **MOR.app** in `/Applications` — desktop UI with system tray
- **`mor`** CLI in your PATH — full terminal access

### CLI Only (macOS + Linux)

```bash
brew tap drm3labs/drm3
brew install mor
```

## What's Here

| Type | Name | Description |
|------|------|-------------|
| Cask | `mor` | Desktop app + CLI (macOS only) |
| Formula | `mor` | CLI binary only (macOS + Linux) |

## Other Platforms

For Linux, Ubuntu, Chromebook, Windows (WSL2), and direct downloads see [drm3-releases](https://github.com/drm3labs/drm3-releases).
