class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.9"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.9/gpk-darwin-arm64"
      sha256 "55e8d1fd034fc903475cc2ddf665f8bfdd934560a436bb1835f14c061c85b933"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.9/gpk-darwin-amd64"
      sha256 "a80ffe520171e846a67a06021deb2903a1f39b9a1afaa74d8971eb0c22e35244"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.9/gpk-linux-arm64"
      sha256 "9a9973088512fee806d84b3c5c000953513e2f9e906912fab3a90180aefd1e16"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.9/gpk-linux-amd64"
      sha256 "cdbc04be9c3ba66db96c40ba9e0de4dce109b0782e8a248399ca5845010b4da1"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
