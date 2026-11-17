class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.7.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.7.0/gpk-darwin-arm64"
      sha256 "94dab4ec50b4b413cd54eb1fd518d86dec4016279d95a1130c4aa0be10a41469"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.7.0/gpk-darwin-amd64"
      sha256 "deafb72c417091210c813a1baea0590707fd337ce63204b00a87672c95bf5206"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.7.0/gpk-linux-arm64"
      sha256 "6d05ace1b1f652e43ae5a807c6006043b72c0b5c6b8d27aabf1cd1dd7cf2964f"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.7.0/gpk-linux-amd64"
      sha256 "a700edea745900be76a3a289155dccb6a7c16fda13dcc02b262236cfc848b9d8"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
