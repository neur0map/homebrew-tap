class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.2/gpk-darwin-arm64"
      sha256 "a414e468374ab221c518f149306c37c361ee7893c25dca7c9974ab13bcd6819c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.2/gpk-darwin-amd64"
      sha256 "3407a74cb8861092c45d863cb30622d57308b70d033fde432b39014711f97c71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.2/gpk-linux-arm64"
      sha256 "109054d71819d8aa858dc27333dc8ba03b5a32499a04d715abaf7da092131afb"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.2/gpk-linux-amd64"
      sha256 "ae1b0a7c7c1b445e5a5ee8dff9fb49a66583665e64dc24ccb5fa51a76f104e63"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
