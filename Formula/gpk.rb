class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.6"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.6/gpk-darwin-arm64"
      sha256 "0882160721baf269e8ed6612f943470f730a99087d6c0015904a104edb0221a4"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.6/gpk-darwin-amd64"
      sha256 "9839fedc32dd71af6a59b02abf91fc784fbdafd3e61f1f24dba485cf842a54c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.6/gpk-linux-arm64"
      sha256 "5514945dbf0b93eef00d7fa66732ad3d70c8164eabf48d1941ce01ce8fd85523"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.6/gpk-linux-amd64"
      sha256 "3fbc82420a3e8def80cb29e49e46cd4145a37f4d33c0a56117c2ae8e9e009801"
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
