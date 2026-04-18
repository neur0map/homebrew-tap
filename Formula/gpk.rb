class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.0/gpk-darwin-arm64"
      sha256 "724713d4ef55c3bba58d226872aba25f2efae058bb07ef6687d5a01c314ec450"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.0/gpk-darwin-amd64"
      sha256 "ab7f31dc1073edc42f3b8b5d017da8962e2d2defc152c47769d890c9fe5a84cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.0/gpk-linux-arm64"
      sha256 "df885f6f510606fd37b009bbe1421b2c535abe78695b05b47658b8eed63395ff"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.0/gpk-linux-amd64"
      sha256 "6814dc3f85f5d82321b7450c3ef8d5f21713c8e2107165392c7dd70f6680b5ff"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
