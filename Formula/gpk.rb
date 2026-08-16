class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.4"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.4/gpk-darwin-arm64"
      sha256 "afc05f582fe9a5a77b0c1169098171a6ad0ec418dcf7b2d1576f668dba8400ad"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.4/gpk-darwin-amd64"
      sha256 "909b1bd06ed212027d5287fb20e81b696d781dd88f959b1379d9d31d5159671a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.4/gpk-linux-arm64"
      sha256 "6e4da0287d995ef68cd2f13f51d32fc5312ff369d4a31b97fe7c74bbd48f7199"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.4/gpk-linux-amd64"
      sha256 "ffcd93b6280a8f4dd27f0122e3e5e9912e01df8fa8df97f706488f04d6875827"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
