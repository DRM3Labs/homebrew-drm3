# Homebrew Formula for Pistachio CLI (standalone binary, no desktop app)
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.22.9"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "ee2ee3672f01bba2e0b775b7db74fd973c635a45f784397cd3268fca16eb057a"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "e86b5940b0d250da6c0ffee6b74998d4508b122a25ac952b1573ac613c664e61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "05a41d1c5a2c39d10afbad6fb3ec3ef95a742a71a529cdb72cf9f0811797eef9"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "04ba80b3f7248cf7ee9ddb45369ececa43aec154ee822383f25574c9ffc4bd8d"
    end
  end

  def install
    binary = Dir["pistachio-*"].first || "pistachio"
    bin.install binary => "pistachio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pistachio --version")
  end
end
