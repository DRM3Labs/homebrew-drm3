# Homebrew Formula for Pistachio CLI (standalone binary, no desktop app)
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.19.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "3d1443933ba265eaedf6958e07b487a5b4f8070b48f7b692e077f282abb6495a"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "30525d1334286abaaab283066d46ed13f2e0a883584247d9f08332f5ccf49f2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "f766789971875137a5dd35a8b41d989f7c2a0af202510109a16207ca980066c7"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "12e7f8e8aafe248a0d78fa4dd53bbb2cbe0cc2f34a6bb5995b1199f40da3f328"
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
