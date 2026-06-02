class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.30.0"
  license :cannot_represent
  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "b31d9c821ddbfd010d724078ae8b61c2abb9e8c1b4865f97982a3e67380cfdbf"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "7d8b2797df527e21d238e47f9d403c06087198ba22d941522a65348e63ef072b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "3c934a11cc364c66c764e48f15f688221209955854e3726d2a406f5c8478b833"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "30b73dd2f4dd0c0eb375be61640f998a3a04e3ed2a9a51ba277f73caec6d5c0c"
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
