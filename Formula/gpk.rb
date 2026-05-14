class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.0/gpk-darwin-arm64"
      sha256 "ba9282a2186ec2114719b5ed9709fe9afaa1b03b6360c2ffa798d42fc1277ec0"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.0/gpk-darwin-amd64"
      sha256 "5d3abc93acc6efcf1e1b69218ce5c666c11cc4a25ea0629c9eaeb4c6918ed28b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.0/gpk-linux-arm64"
      sha256 "344a83ed8d0b2d8f7e4e33f330a775cc2ca82bbeef55ee66df4dceb7e2b0f062"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.0/gpk-linux-amd64"
      sha256 "85bcdcf0217d8632fab6762935e8a986039e9e3eb3625a49e17180fb6261b915"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
