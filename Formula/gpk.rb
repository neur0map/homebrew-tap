class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.5"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.5/gpk-darwin-arm64"
      sha256 "597d30ab520802f3d09ad01b136646434007cef111dc707485d85ae405278441"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.5/gpk-darwin-amd64"
      sha256 "5f7ddce14033b1adce17a43df3746bb9a7d8103c232c75f3b105c74e4659ead5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.5/gpk-linux-arm64"
      sha256 "e184a157689cc9c3a5f7da51b44f2c98e835c01123adcc5b16b70251629ce72a"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.5/gpk-linux-amd64"
      sha256 "11917e9b9e66353849fee48927470729fb1247a99ab1224d9b8a40f4e1fc98a7"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
