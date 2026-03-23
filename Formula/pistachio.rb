# Homebrew formula for Pistachio
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"
  version "0.3.4"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "c5a198a2bded6bb4f637ec77fb61a51c7daed680283129b4ebabbfdc91e4e4f2"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "c7df9360d94772d3479dead94e9f699a6bce99cf528ff21c165afd48a8fffe39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "02a8dd53c1fc9b8e957511de95d83c9e9253a7c6a613840b6e4dc0eadb46dba2"
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
