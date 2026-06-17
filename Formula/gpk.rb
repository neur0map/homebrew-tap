class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.6"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.6/gpk-darwin-arm64"
      sha256 "2d02a53592e8acc59a32c624c23457415121844c1d3054a2c8d9d64b4bb428ae"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.6/gpk-darwin-amd64"
      sha256 "fcf8f01d4cb63432b18ffdfa1ad67047cd1d73307073f11414b4a43c49b0772f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.6/gpk-linux-arm64"
      sha256 "cfc1e8d602972aff8295a8ee4f174d83f977e0bb9511df7791eb4c66771d491c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.6/gpk-linux-amd64"
      sha256 "74f4794cd3ebc441d71c846e947cad69beb05049b0ae9b46da898148a281dadb"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
