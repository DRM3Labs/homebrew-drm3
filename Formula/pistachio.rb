class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.28.2"
  license :cannot_represent
  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "6879c290aeef711ce7a780039a0b88e0f109832d0918b3ab3dde51d487fa3f13"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "0c4f5b4965f0b624136a9b1334c22395084d43bec777dd78ea13d87ea5f8913d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "a55160780a7b0291e0d09d2da7d2c5c6d632ba82943227640f2c4e10c0ffbd2d"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "d51f3776fe03b79929e56063077b4bd45e874419ba64464d6e9aa858e750c506"
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
