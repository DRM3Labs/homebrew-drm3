# Homebrew formula for Pistachio
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"
  version "0.5.37"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "d6a6d3b1777b3585dc72841d20192621c9f2007700a7dbd39429f4006d20c235"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "1ecbab3a040218046d62abbd3fe74df87d26dcf62ce41e173f6aa5d631dea866"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "583d0d5f309a789a364e519b2f6dc9ffccb20d65e08b4c9a9b5ad35643ba0884"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "4e067cd2c6b99f0dfb980204a17667f94e44e63b7adc9c83a538e6efec3e8dd9"
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
