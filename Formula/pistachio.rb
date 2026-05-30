class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.28.3"
  license :cannot_represent
  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "b9983f420c5a159e0ae1cdf0f426838c9a2e2798be20410d42fc15d74979cc43"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "fb742df8d22104f646f86566493daac22e08f02b6305fb1e2b6bbd0a71bf3d49"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "99e7a5f0e185ad5cbfdfc61bacb2f735d61ec2fc7e7e2fa27456ad758a6035ad"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "80069178c2c728eae774dc40d13e8afb034f57785fe2297fc5485637cc5b894e"
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
