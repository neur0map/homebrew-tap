class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.27"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.27/gpk-darwin-arm64"
      sha256 "8b88e1da5b364017adc2bd8b6bef2ea6a76d32878e2c0254e3863a3cd01b36e4"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.27/gpk-darwin-amd64"
      sha256 "97f5dce960444bd5364f2a292e65a559827acc62317b4b6acd7e4970d5edf683"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.27/gpk-linux-arm64"
      sha256 "bc9716a1d20918f715709c767745788f4182a931e4ce658346c8905349a1dfa8"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.27/gpk-linux-amd64"
      sha256 "bbe4d0b38134a569cb4052e6190d3ad331f689fff0db6b38dad5b5272a1919b3"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
