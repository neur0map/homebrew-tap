class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.4"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.4/gpk-darwin-arm64"
      sha256 "3fe418e6999dcd195b71d8ed773a5065a04cf36758771c8286c8572d1b52fb37"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.4/gpk-darwin-amd64"
      sha256 "afb9d5b469586bfeb65be4d9a43d04b98729300a5c3ea0277b4fe6a03ee8e218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.4/gpk-linux-arm64"
      sha256 "37b26cdbe0d12663ec3f3814d4574b721b9cb0d8945973d1d589999ba86f5aed"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.4/gpk-linux-amd64"
      sha256 "b2bc5cd1e2c68874994fc1ac093441852abfe0d07c91862fdbc38f9c4c8ebc2b"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
