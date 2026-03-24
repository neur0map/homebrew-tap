class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.4"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.4/gpk-darwin-arm64"
      sha256 "157b34f22b40ae52a985629c8aa8f698c6c2721d620535a0b5656070eb57e17d"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.4/gpk-darwin-amd64"
      sha256 "d992d65517034fbe8eabe604c5e76130a8b431da4cc81ab40e4686a6e9e5ca41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.4/gpk-linux-arm64"
      sha256 "cadab5735926b5320036ea9f55f579a6769844b0e3d180f022dcfe7e37221264"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.4/gpk-linux-amd64"
      sha256 "d4e5bd578eb858abe8b8bedc52087fecd6fe5e7d0579ed56ab235402040ef587"
    end
  end

  def install
    binary = Dir.glob("gpk-*").first
    bin.install binary => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
