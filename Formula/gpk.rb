class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.3/gpk-darwin-arm64"
      sha256 "f0649c58bbb9f0bcb9ac4979cb5b73982dfc1687b3261522c260852866575b90"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.3/gpk-darwin-amd64"
      sha256 "c59092ec930295947166a33f1d8a3384d524a399d0f88f36989f3070ce7f6c19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.3/gpk-linux-arm64"
      sha256 "a504e550cd5052f12bf3aab5885459e2e4886d631a5f5c3d2218ff8650e750f4"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.3/gpk-linux-amd64"
      sha256 "ae34487012387588f84364721814ada0b7f153d5b4ba8399e1bc82b4b3f4785d"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
