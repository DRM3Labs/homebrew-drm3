# Homebrew formula for MOR
# brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.2.4"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "6e401d02dbcc8f599a282efe165c8e68b2f3312ce2ed8ad4f5559b9e0341b5bc"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "f5dd2c05fc2dc5264ab8bb7434e25a1192675f63db75a1921458fb0a47961022"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-arm64"
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "692b581af11ab73fc71c99a4741aea4956a990accc84707baf3ceae303487742"
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
