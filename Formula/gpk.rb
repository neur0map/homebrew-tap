class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.7"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.7/gpk-darwin-arm64"
      sha256 "918f5d3db2dd7bc73c640c69ccb944ba71f25ac5d3bfcc2a1ff16c5ce7f24df0"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.7/gpk-darwin-amd64"
      sha256 "538a697fb9dbeb571dd8ec784692c30d33dec85628a5884dab980552c707f293"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.7/gpk-linux-arm64"
      sha256 "4a1bb73abb47c1e639dcc017a55d2a6d11389b279170847fdc6cec486f4a2773"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.7/gpk-linux-amd64"
      sha256 "fb9b2ac043fa4f32296bb2b40462fa1345f598ee671128c1dfccd666d0223c1b"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
