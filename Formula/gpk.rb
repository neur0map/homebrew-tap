class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.5"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.5/gpk-darwin-arm64"
      sha256 "417d3f797295ceb3ae3057f02b6bf4a2ee4133802efa8484a5970e0a0dfdb113"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.5/gpk-darwin-amd64"
      sha256 "eab3eb7875ed2b49f1b24cde83912522c4c43d1938532542db5de8875a5b3dba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.5/gpk-linux-arm64"
      sha256 "eb355e3fd6f76e4050f17a0e04230ac5579efc36270738f91bd1265e226670fb"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.5/gpk-linux-amd64"
      sha256 "c2addf0312edb6a0d313f825f86b5075d8f8754fadeab3a3dee01e332840ab19"
    end
  end

  def install
    binary = Dir.glob("gpk-*").first
    bin.install binary => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
