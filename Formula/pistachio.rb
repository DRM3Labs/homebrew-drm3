# Homebrew Formula for Pistachio CLI (standalone binary, no desktop app)
# brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.19.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "57f189dea00f4dbd5424283694956dc255e594b4e64a9f9661c4fd1ce94d0af4"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "0e46b5f714f3d2fee50ae121f1119a91d45200193da0eb909039e176d72a3767"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "dbbf213d089b35e9d1ec0a782b91ab231e816f46ab110a49702ebf012672fe42"
    end

    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "26ee4a532dc6aa50bf2a59a2b550250d5cf1500bea0da7abfb4f60200aaa34c2"
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
