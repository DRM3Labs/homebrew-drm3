# Homebrew Cask for MOR Desktop App
# brew tap drm3labs/drm3 && brew install --cask mor

cask "mor" do
  version "0.2.3"
  sha256 :no_check  # Updated by release automation

  url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/MOR_#{version}_aarch64.dmg",
      verified: "github.com/drm3labs/drm3-releases/"
  name "MOR"
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"

  # Only macOS — Linux users use the Formula
  depends_on macos: ">= :catalina"

  app "MOR.app"

  # Expose the bundled mor CLI binary so `mor` works in terminal
  binary "#{appdir}/MOR.app/Contents/MacOS/mor"

  preflight do
    # Remove quarantine from the DMG contents (no Apple Developer cert)
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/MOR.app"]
  end

  postflight do
    ohai "MOR installed to /Applications and `mor` added to PATH"
    ohai "Run: mor config set private-key && mor serve"
    ohai "Or open MOR.app for the desktop experience"
  end

  uninstall quit: "network.drm3.mor"

  zap trash: [
    "~/Library/Application Support/network.drm3.mor",
    "~/Library/Caches/network.drm3.mor",
    "~/Library/Preferences/network.drm3.mor.plist",
  ]
end
