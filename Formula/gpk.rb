class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.26"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.26/gpk-darwin-arm64"
      sha256 "c670127c2cbc8e2198c081c29c9e44ec09a1139bf29dc927db7b0a6d2f2de6c2"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.26/gpk-darwin-amd64"
      sha256 "3f1a9e67168551833f2332bddfc119130209d604ded690e0d0b5771a5caa2532"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.26/gpk-linux-arm64"
      sha256 "debceb3eee33763521b103a87e941a65b88d9fbe7268e9b62c21379e62b569c7"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.26/gpk-linux-amd64"
      sha256 "00d50766834020c6c12f880bb8baa24b198f94da3df15d0219aff4da43067004"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
