class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.3/gpk-darwin-arm64"
      sha256 "74ae9ce0d08922c2c967b06957056bae51ceaf8dff32e5f8914111a06a308adb"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.3/gpk-darwin-amd64"
      sha256 "9a1daea9a0dede8d4e63ebd01a728951e983a96a333a7f7914c833631dff1316"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.3/gpk-linux-arm64"
      sha256 "3a3892a9e8b0b933f829a66e614cd906c5b5d4ff8b137af23d7d1137c22a0d48"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.3/gpk-linux-amd64"
      sha256 "19c4dbc7999562873fba67110fe7ca64c53479b057bf270dfc4ed70f7fdd72cf"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
