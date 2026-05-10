class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.4.6"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.6/gpk-darwin-arm64"
      sha256 "9f23ddb1cd16e9f9908e077ed51b4e09709a35f34e839ee688353cc656655323"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.6/gpk-darwin-amd64"
      sha256 "2899f1d12d050fa9d9d796000b6d7d712a67b9560bd4b9f0fdd03e38af25a3de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.6/gpk-linux-arm64"
      sha256 "9c5d107926c36965ee0fb7e5b37f6c30c8a34efa55e892270779fb75f5c2000b"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.6/gpk-linux-amd64"
      sha256 "bca08e0c1a860be6ca18204501b1c9d33b819ef8c147e49a380b15c2bbea67ee"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
