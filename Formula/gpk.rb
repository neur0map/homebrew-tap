class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.14"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.14/gpk-darwin-arm64"
      sha256 "5ad79b057238914b572aef726a83d79191637aa5146651e3bd0174d0b0e5db1c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.14/gpk-darwin-amd64"
      sha256 "2608011bfc9cd4a55b963cfc881ded469636d99ecdff16765efcaa983b1d164a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.14/gpk-linux-arm64"
      sha256 "d7c8199044138f9299fed93673fb3cb36f1e9840e61169c25dd9de607e432e02"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.14/gpk-linux-amd64"
      sha256 "bf26bea1e1d067731ab1b712113707027ef3e0486983ea5dedf098690d6e54c3"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
