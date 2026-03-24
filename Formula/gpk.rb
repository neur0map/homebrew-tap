class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.3/gpk-darwin-arm64"
      sha256 "d61b7e6a1e445eeb909fcbbb1178b9b15555262492a915e9bb0257afae54e06e"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.3/gpk-darwin-amd64"
      sha256 "e0026824584e826842e37c3ba01121637234776dc4f384417f07a7ea6cac084a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.3/gpk-linux-arm64"
      sha256 "dedd1553331431c9d4d265f5c131f30b5f9abd9a145ccd9ded7449266e9aba73"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.3/gpk-linux-amd64"
      sha256 "56c67259a9a1b0b6e90b839734a523697849a37aba5654e8145754486f70243b"
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
