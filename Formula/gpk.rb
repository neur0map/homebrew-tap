class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.13"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.13/gpk-darwin-arm64"
      sha256 "7aa05ff23d5a3f1ed158a1209eee1db440edfa1012b341cbe55a6668f30d8978"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.13/gpk-darwin-amd64"
      sha256 "07ca397abc1a5936b798b156516138c26bbda9dfa3d14569345f55ed05bcaf98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.13/gpk-linux-arm64"
      sha256 "aaeb54ece579e0e9743fa06bc364dc21954d252b41ee8b5d6b684610a7c99c95"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.13/gpk-linux-amd64"
      sha256 "e171e3ea668180e19faf182eb4d2db90e3429ec3a25dbb3c09de36f98ff68e95"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
