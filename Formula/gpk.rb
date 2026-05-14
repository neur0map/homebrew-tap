class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.2/gpk-darwin-arm64"
      sha256 "e494205f6978792b1e275c812d9d396d6823774b7734d07057feaed44b64ec77"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.2/gpk-darwin-amd64"
      sha256 "f22ae59507e627fff520ec7ddaa9f11f657441f05e40ac357c44d14ebf320023"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.2/gpk-linux-arm64"
      sha256 "2f40ac2b09421b28fedf796739918addd24519c7d8f22c6b20099642a77e8dcd"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.2/gpk-linux-amd64"
      sha256 "b87a95b0abe709316fa5ddd8087516d7d89e943f3ff6817ad833c07efd7b0f30"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
