class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.30"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.30/gpk-darwin-arm64"
      sha256 "6a846278658f010613d7f73250a8e1f3e26a807054874342fd28a2579f473ea8"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.30/gpk-darwin-amd64"
      sha256 "7428a9a9e5ce0c7b557a80d1b3fef403f77de4f4c0eba9ec26578129aa35bbaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.30/gpk-linux-arm64"
      sha256 "3f53bb52f33b97c8b77b3e0ea48854a3250897c020dd3486737195046eaef37c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.30/gpk-linux-amd64"
      sha256 "d26913d9a29ee2e439e2d1f2146c01c6f63ed426c30f2708d7bb119f713484d6"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
