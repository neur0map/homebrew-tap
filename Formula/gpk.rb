class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.12"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.12/gpk-darwin-arm64"
      sha256 "6663b64ebd54a614191efb61366de7d76adff0c5afbf3e52f379ac96eef8ba63"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.12/gpk-darwin-amd64"
      sha256 "43c7783f172246618b56220799ef4ffc1affe5c07dfb8af6276f2f9cd9aca7c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.12/gpk-linux-arm64"
      sha256 "5b34bdbe02d228febe3e5e9ec6f2c9ef157112faedb405535c6a018c21041050"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.12/gpk-linux-amd64"
      sha256 "afea53317448745bdb16aec8a732c514d385dbd975b98f84f2871dad6f5d3d84"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
