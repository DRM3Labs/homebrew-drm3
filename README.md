# homebrew-drm3

Homebrew tap for installing Pistachio on macOS and Linux.

## Install

### Desktop App (macOS — recommended)

Installs the Pistachio desktop app + `pistachio` CLI in one command. No Gatekeeper warnings.

```bash
brew tap drm3labs/drm3
brew install --cask pistachio
```

This gives you:
- **Pistachio.app** in `/Applications` — desktop UI with system tray
- **`pistachio`** CLI in your PATH — full terminal access

### CLI Only (macOS + Linux)

```bash
brew tap drm3labs/drm3
brew install pistachio
```

## What's Here

| Type | Name | Description |
|------|------|-------------|
| Cask | `pistachio` | Desktop app + CLI (macOS only) |
| Formula | `pistachio` | CLI binary only (macOS + Linux) |

## Other Platforms

For Linux, Ubuntu, Chromebook, Windows (WSL2), and direct downloads see [drm3-releases](https://github.com/drm3labs/drm3-releases).
