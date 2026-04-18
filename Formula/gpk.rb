class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.4.1"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.1/gpk-darwin-arm64"
      sha256 "4a87deadbb461cc81616a6ebe915c462309cdd50c3430e0450c5aea9fb14c653"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.1/gpk-darwin-amd64"
      sha256 "e7305a8c4f3db6a1133539cd26d5d01a48094ef3103141fc5214c2c89cb4f1d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.1/gpk-linux-arm64"
      sha256 "0fda910e3867d8c0d2825009e4d37e9e8256e12c0522b234550fbfb9504f70e2"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.1/gpk-linux-amd64"
      sha256 "8e7ed0f25d91a1b452fae6b58365267a8c5313587c1f2bc376e79cd155c5c2ee"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
