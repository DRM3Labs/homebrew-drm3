# Homebrew Formula for Pistachio CLI (standalone binary, no desktop app)
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.19.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "eec9352a43424dfc19a59c7fb85998ee078f627182829bc71311d53e9653b773"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "292ec2d7edf637945f8b03b23abd9b97b45538283b0ba5bd103197fd39603879"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "0699eb1f832c250f4ae470e3d9f91be4e709aad6b9b3581db8a681831cb8e3d9"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "70051ed6998325e3eb483cffdda96752313660375f68de87ebee30f878fbe224"
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
