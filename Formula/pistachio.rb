# Homebrew Formula for Pistachio CLI (standalone binary, no desktop app)
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.18.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "" # TODO: fill on next release
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-x86_64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "" # TODO: fill on next release
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "" # TODO: fill on next release
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-x86_64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "" # TODO: fill on next release
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
