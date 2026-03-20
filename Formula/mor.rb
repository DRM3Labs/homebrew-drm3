# Homebrew formula for MOR
# brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.1.5"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "c0fdce8dc2e8a73463af4fb6ac7cc68747ebcc4182d68914d3af4aea4674c17b"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "70520d38fff4cc6511f36376bd82d8a1e35be8b59750a79991f04662acc67c62"
    end
  end

  def install
    binary_name = "mor-darwin-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    bin.install binary_name => "mor"
  end

  def post_install
    ohai "MOR installed! Get started:"
    ohai "  mor config set private-key  # Connect your wallet"
    ohai "  mor serve                   # Dashboard at localhost:19377"
    ohai ""
    ohai "SDK key is auto-provisioned from your wallet — no manual setup needed."
  end

  test do
    assert_match "MOR", shell_output("#{bin}/mor --version")
  end
end
