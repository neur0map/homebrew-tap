class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.25"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.25/gpk-darwin-arm64"
      sha256 "0805e9373751ba27aa9dd3d12046ad0169670ce2cae83a2f5edd0b9dc2890e52"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.25/gpk-darwin-amd64"
      sha256 "490a43ab826826abead750d191398b10b5ff670c4cd262f517f8a8fa12771bd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.25/gpk-linux-arm64"
      sha256 "b1847f1fa9578da5529ff889c1412ceb4add3c0cc57964f6b911dd1c6dc5e2f2"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.25/gpk-linux-amd64"
      sha256 "a4d00097fa1cecb21c1c3f05c3ae26d5106346e8dc8404c8f20465078e7f2b30"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
