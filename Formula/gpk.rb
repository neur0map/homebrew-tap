class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.8"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.8/gpk-darwin-arm64"
      sha256 "d0766d8dc50caaec434775dfd1b3489e0941bfce417701effc96eb91e34d3308"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.8/gpk-darwin-amd64"
      sha256 "7cbf43aeb2543ca1cf47a4d3a8a99de8be869994712e33fd7549b8651071f245"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.8/gpk-linux-arm64"
      sha256 "f57061f97059e7d918f2f2b4e5eef88cad5794c5387b5793c16929074a0ca136"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.8/gpk-linux-amd64"
      sha256 "1c5007c342dcd2851943ca73810d6b40ebef08579d89f3ae0c0d80f24047ce4f"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
