class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.31"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.31/gpk-darwin-arm64"
      sha256 "02dc127ea6bc4f57b2ba5162fffb035f8e5442747ecdd9516ca7742515259f6b"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.31/gpk-darwin-amd64"
      sha256 "ea5779e7ed7a4f7230a705c73074c3f445c80596524cb648c3549cc43fd7ce41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.31/gpk-linux-arm64"
      sha256 "5f9c81e26aa3247a21f0f43dbad3f02140f9a10464e4b638aad33477fa451cb4"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.31/gpk-linux-amd64"
      sha256 "ae91c3ace031e4585eb67033fb977335dce61d6dec1d8cd8468af86ab9704348"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
