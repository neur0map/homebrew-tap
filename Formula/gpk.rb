class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.15"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.15/gpk-darwin-arm64"
      sha256 "9607a4173d12e2bd48a0b81215a4e9c6fc2b938821f64c8804743a259bace01e"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.15/gpk-darwin-amd64"
      sha256 "6db468a013ccbc253a734b64fca56fdc5adbab87eea355a74bf5e4d171b7d0d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.15/gpk-linux-arm64"
      sha256 "5badf01bde21cf59665329bf87759f14b940de3a4a94e2b362e04d26df805e18"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.15/gpk-linux-amd64"
      sha256 "6e175135b23a8ed6d222411c11bdf8da537d46a034c1835d9710587892977d61"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
