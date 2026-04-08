# Homebrew Cask for Pistachio Desktop App
# brew tap drm3labs/drm3 && brew install --cask pistachio

cask "pistachio" do
  version "0.9.4"
  sha256 "8356051a2ebfb97d8c646d0247ff7ff93d7e79a882179e5dfc6477c50c1377ac"

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
