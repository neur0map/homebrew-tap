class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.1"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.1/gpk-darwin-arm64"
      sha256 "dc7f9e3a54d0785fdb2d82f9395be219610c564359229d6520f9edb213f7f7f1"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.1/gpk-darwin-amd64"
      sha256 "d165f736f76bb3171d6b29f890a7b27f417c894c45c3b111fe007033e1b04a30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.1/gpk-linux-arm64"
      sha256 "a4c630656c652870f85908449ffb67507111efb70de41a686c43974d7eb6be61"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.1/gpk-linux-amd64"
      sha256 "b5c7559b7af6c007615caaaf175b253f09e85cff803ad586e6182185a0ae1928"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
