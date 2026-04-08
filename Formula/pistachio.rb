# Homebrew formula for Pistachio
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"
  version "0.7.1"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "0a04a695172591b7ef7089ac0edcc3d4807b91a8975623c55d1cf750a80ed27f"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "ac0ecbc850c5afc8d4f91b4e20e06f8e91ab1ac597ed94fbf8be01cc4402027b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "59079841be6bce1db7797c0fd43c819fe186e5a6b71794ce6d3e62f5516a60f4"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "fd4181f4def8adafc05871a928b647abc8552a7cca116294fc1c3ce4cf13438d"
    end
  end

  def install
    binary_name = if OS.mac?
      "pistachio-darwin-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    else
      "pistachio-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    end
    bin.install binary_name => "pistachio"

    # Remove macOS quarantine flag (runs with install permissions)
    if OS.mac?
      system "xattr", "-cr", bin/"pistachio"
    end
  end

  def post_install
    ohai "Pistachio installed! Get started:"
    ohai "  pistachio config set private-key  # Enter your wallet private key"
    ohai "  pistachio serve                   # Dashboard at localhost:19377"
  end

  test do
    assert_match "Pistachio", shell_output("#{bin}/pistachio --version")
  end
end
