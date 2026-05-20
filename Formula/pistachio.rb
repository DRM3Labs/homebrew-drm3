class Pistachio < Formula
  desc "Pistachio — DRM3 P2P inference client CLI"
  homepage "https://drm3.network"
  version "0.23.0"
  license :cannot_represent
  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "c2df42579beb215aecfbc748f65ca4a5c527880c54df9bebaf77dfec90a31743"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "edd6a22a85d91a62f17c36e2d9d26824434c39721312fc434b3342cb148e73ce"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "37bfab262b66aa6f2d75323b9245d5e8a4c874111970d9a048e3c92d5297bb4d"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64",
          verified: "github.com/drm3labs/drm3-releases/"
      sha256 "3cc1c21495849ba915118f59f7521ac2209000e16b7b48b98999019183fd8563"
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
