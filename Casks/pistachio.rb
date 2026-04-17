# Homebrew Cask for Pistachio Desktop App
# brew tap drm3labs/drm3 && brew install --cask pistachio

cask "pistachio" do
  version "0.9.40"
  sha256 "e91de4fb11e441f37274c31b8966f35a15e492bc7171a2eaf6c7596548ffebca"

  url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/Pistachio_#{version}_aarch64.dmg",
      verified: "github.com/drm3labs/drm3-releases/"
  name "Pistachio"
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"

  # Only macOS — Linux users use the Formula
  depends_on macos: ">= :catalina"

  app "Pistachio.app"

  # Expose the bundled pistachio CLI binary so `pistachio` works in terminal
  binary "#{appdir}/Pistachio.app/Contents/MacOS/pistachio"

  preflight do
    # Remove quarantine from the DMG contents (no Apple Developer cert)
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/Pistachio.app"]
  end

  postflight do
    ohai "Pistachio installed to /Applications and `pistachio` added to PATH"
    ohai "Run: pistachio config set private-key && pistachio serve"
    ohai "Or open Pistachio.app for the desktop experience"
  end

  uninstall quit: "network.drm3.mor"

  zap trash: [
    "~/Library/Application Support/network.drm3.mor",
    "~/Library/Caches/network.drm3.mor",
    "~/Library/Preferences/network.drm3.mor.plist",
  ]
end
