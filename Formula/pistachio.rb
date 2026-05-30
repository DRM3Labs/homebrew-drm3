class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.28.0"
  license :cannot_represent
  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "dc09cc3524c2444f63bd39d963537126ad1aabd493faca89b137db6bf36005e6"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "f5e14c33ca16d637408854e32d742e83d8b34e2b277125ddc0e16b87ab2eb5bc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "0aae59b1e8a39f937a096b1cd08edc8b613d79f24c08230352dee2ebbc100da0"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "1d5a846b5a5237fe2ff389fc92396243545a93da8aa2a127ada1027323cdaef6"
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
