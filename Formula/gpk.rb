class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.4.4"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.4/gpk-darwin-arm64"
      sha256 "6fe92c208aa96d337ab816cd5013f61d15b79d86ad647ede3576b6f3e11ae894"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.4/gpk-darwin-amd64"
      sha256 "d9c854b51db656c5411ad236cbd78031b2d92f348d1bada4c0f01d827c0cc72d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.4/gpk-linux-arm64"
      sha256 "5193c3ca1dc5ea2e80d1b613daf21b28df74c29a3587140c361333c195ee1ba8"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.4/gpk-linux-amd64"
      sha256 "37d2e32e8e0a3b756244b105c4d78200b7d3b5f2e71a98924f836f38c86431a4"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
