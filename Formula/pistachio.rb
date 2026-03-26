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
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "fb137f64ff4b52382e2f4a188fae3ef4056754c1a376f525d906cb0c881f738c"
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
