class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.21"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.21/gpk-darwin-arm64"
      sha256 "ac301e5b8f80a90b30da1d6e5e64fe097de51e987015578beaae17331042ee6c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.21/gpk-darwin-amd64"
      sha256 "b4d54edeb06b2a8354e6593e7e95d3617b269eca0941966a103aa2a65aa8068a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.21/gpk-linux-arm64"
      sha256 "07e1c7bc55e22d9eceaf4755bce9ac14b9410b8f958e5e26963afaf4d5ff166f"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.21/gpk-linux-amd64"
      sha256 "051403ffd34a2c83da646d2328ff99ef87933a35a2bc17d79d9683e3d569e6b8"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
