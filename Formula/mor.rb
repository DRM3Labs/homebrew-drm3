# Homebrew formula for MOR
# brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.2.3"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "5f29923933f9cc1a33e8885709bce300a4283d34f5932442e09a43b9fce49188"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "09ba2b6735a0d29319edc742bc4f19fcbe593018df14564019ffda880f390992"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-arm64"
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "41e25eb96e88bfaacee322396a0b222cf18b16e5f68952bc7c0b9e7ec12a5eb5"
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
