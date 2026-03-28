class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.19"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.19/gpk-darwin-arm64"
      sha256 "9c919f366dae4a3e98eb135716071931476703f44d5a02d900fabb99f9f2954e"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.19/gpk-darwin-amd64"
      sha256 "3bcba4ddf05090345a037a9802132c4da8ef49999e2142305af077db4b10d7a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.19/gpk-linux-arm64"
      sha256 "ff6b63baa82850422f36361d65c815e7835993d4a10e9c6f3f18a36c0a57563d"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.19/gpk-linux-amd64"
      sha256 "d4daae8a063ca5f2678df8c243759dc5f1906977d8203d2e23113249eb129175"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
