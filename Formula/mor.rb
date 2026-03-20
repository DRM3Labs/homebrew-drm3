# Homebrew formula for MOR
# brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.2.1"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    binary_name = if OS.mac?
      "mor-darwin-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    else
      "mor-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    end
    bin.install binary_name => "mor"
  end

  def post_install
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mor" rescue nil
    end

    ohai "MOR installed! Get started:"
    ohai "  mor config set private-key  # Enter your wallet private key"
    ohai "  mor serve                   # Dashboard at localhost:19377"
  end

  test do
    assert_match "MOR", shell_output("#{bin}/mor --version")
  end
end
