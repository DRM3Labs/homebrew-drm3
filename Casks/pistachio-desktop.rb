# Homebrew Cask for Pistachio Desktop App
# brew tap drm3labs/drm3 && brew install --cask pistachio-desktop

cask "pistachio-desktop" do
  version "0.18.9"
  sha256 "62e64e06a1d7a085d474a6bb80c113d39dd92ce8d4994df37bab5464e4a14206"

  url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-desktop-v#{version}/Pistachio_#{version}_aarch64.dmg",
      verified: "github.com/drm3labs/drm3-releases/"
  name "Pistachio Desktop"
  desc "Pistachio Desktop — DRM3's Morpheus-compatible P2P inference desktop app"
  homepage "https://drm3.network"

  # Only macOS — Linux users use the Formula
  depends_on macos: ">= :catalina"

  app "Pistachio.app"

  # Expose the bundled pistachio CLI binary so `pistachio` works in terminal
  binary "#{appdir}/Pistachio.app/Contents/MacOS/pistachio"

  # Expose the desktop launcher binary
  binary "#{appdir}/Pistachio.app/Contents/MacOS/pistachio-desktop"

  preflight do
    # Remove quarantine from the DMG contents (no Apple Developer cert)
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/Pistachio.app"]
  end

  postflight do
    ohai "Pistachio Desktop installed to /Applications and `pistachio` added to PATH"
    ohai "Run: pistachio config set private-key && pistachio serve"
    ohai "Or open Pistachio.app for the desktop experience"
    ohai "CLI-only install available: brew install drm3labs/drm3/pistachio"
  end

  uninstall quit: "network.drm3.mor"

  zap trash: [
    "~/Library/Application Support/network.drm3.mor",
    "~/Library/Caches/network.drm3.mor",
    "~/Library/Preferences/network.drm3.mor.plist",
  ]
end
