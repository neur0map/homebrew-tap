class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.17"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.17/gpk-darwin-arm64"
      sha256 "c5ac221e5ab44ec9e47a076f4e05147d61a71baf31df91e0e439fb6d39dc6b8b"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.17/gpk-darwin-amd64"
      sha256 "4cd7bda8b2368b332ecf46a7d1debe511bbff755832c794ce314d0e03f826ac6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.17/gpk-linux-arm64"
      sha256 "267032db84bc72313dc947709329eba3c660a8de6f4afc5343cb9df56a88914a"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.17/gpk-linux-amd64"
      sha256 "dcbe2c89b1a068111add0dad76af5dc37765835a09722147de3e28e9eeef04ca"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
