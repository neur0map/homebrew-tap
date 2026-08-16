class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.6"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.6/gpk-darwin-arm64"
      sha256 "db461b6b39201bc01a1344caaa8a8047fd717df4f47723a095af2685cbac14ae"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.6/gpk-darwin-amd64"
      sha256 "960230811f23d2469c60d8dfe50d04cf98f56389c6b9db31ae31dca2c6e2bac0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.6/gpk-linux-arm64"
      sha256 "724fbb854372231f8d946d9cd9b4c6352f2d1a0c527220f4b562ab06b8a390ad"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.6/gpk-linux-amd64"
      sha256 "ca4c539997767688dd20b0453952aa867fb064d8aea7bff95af9e067a7081e15"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
