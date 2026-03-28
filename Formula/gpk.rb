class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.20"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.20/gpk-darwin-arm64"
      sha256 "9c4665d4d34ed661c410863cf2a1a285d498897bd14d1f4b9e7a89454fa16dee"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.20/gpk-darwin-amd64"
      sha256 "2f4449faa9039428759baa5904225eede8ee37c4d2f84ef3d8a93601c4b6193e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.20/gpk-linux-arm64"
      sha256 "b19e3e8854ce79d4da652de1113efe91ffac0d54788327a09f86816f68748bd7"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.20/gpk-linux-amd64"
      sha256 "94dfccb1e6df18e797be845f50be7e4a9446f6d04349920938619f748aa6389e"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
