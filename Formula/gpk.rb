class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.4.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.2/gpk-darwin-arm64"
      sha256 "ae56f880d947a1a29fbe9046435cae7711e97284079fd44791392c1d633aeb2d"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.2/gpk-darwin-amd64"
      sha256 "2685c8dfde5b67d6ba185b6b09529484d28f7e013fc9719a7b661cd92c87bb67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.2/gpk-linux-arm64"
      sha256 "b9fccca5e8936501a1bae16d1e43f3ea56d9a6941a32bcd89d5cb98a1bd68267"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.2/gpk-linux-amd64"
      sha256 "a504f017d5aa2f7f187be52a422588fc3425893daf97899b7a64aa1808486997"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
