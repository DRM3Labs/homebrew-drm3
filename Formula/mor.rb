# Homebrew formula for MOR
# brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.3.0"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "8a1a62171c52acc8917d3d9fa68128ab33d8c05a254954d2143469aeb44876c2"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "0c9a16563c44ccc647dd9eed41c6b2d4c9601825ca5e657aca2fd7ed85ff2df4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-arm64"
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "2a9bdbc06e8146d39da237c5ab987ceeefdf03b626236bec9e947b18da2cc013"
    end
  end

  def install
    binary_name = if OS.mac?
      "mor-darwin-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    else
      "mor-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    end
    bin.install binary_name => "mor"

    # Remove macOS quarantine flag (runs with install permissions)
    if OS.mac?
      system "xattr", "-cr", bin/"mor"
    end
  end

  def post_install
    ohai "MOR installed! Get started:"
    ohai "  mor config set private-key  # Enter your wallet private key"
    ohai "  mor serve                   # Dashboard at localhost:19377"
  end

  test do
    assert_match "MOR", shell_output("#{bin}/mor --version")
  end
end
