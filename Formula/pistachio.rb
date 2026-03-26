# Homebrew formula for Pistachio
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"
  version "0.4.4"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "55a8bcb95d5f2009bdd154863e0b00a39ac1835d1b3d1e8a7aec136feb3118ba"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "fc2f45841a7debaffe03d3df998ac44727378b4a2f6f8c8ccee0b23e77de636a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "2e33ffe401895373a0f98951be40e8a3674918a2827d071443fca1793dd0a085"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "aad90b39a1ba52ca317c7b36c1d3caaa321dde7effef8b2fc8b772e47a12c24e"
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
