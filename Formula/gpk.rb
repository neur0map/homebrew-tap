class Gpk < Formula
  desc "TUI dashboard that unifies 42 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.1"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.1/gpk-darwin-arm64"
      sha256 "c3489813afb3a29f12fce06b99dac367ea202c3f9278d986a3853aefdb4f111d"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.1/gpk-darwin-amd64"
      sha256 "769668c75912f5f26075d97eac76c867b02acb868271ee04079dbdd251bd0774"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.1/gpk-linux-arm64"
      sha256 "a30dc4a25e0e38ef253a3b9b2662945185941465e2b735019094a07a1207bb93"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.1/gpk-linux-amd64"
      sha256 "9be848f8108e454febcf595c4a03a00f659e1c1eca86bdc3e9163f6b0206e18a"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
