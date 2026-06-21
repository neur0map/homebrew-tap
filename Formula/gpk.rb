class Gpk < Formula
  desc "TUI dashboard that unifies 42 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.0/gpk-darwin-arm64"
      sha256 "f92a2e27821cda74955b1087d8d877708ad4ad5f58cdf41466bfa85ad84558b9"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.0/gpk-darwin-amd64"
      sha256 "1920d3ed48ee409729dbb87a65604a8acc2fc80b9acb4936d42f9e78228bc56a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.0/gpk-linux-arm64"
      sha256 "335624fa9926d72dccf3b8d0fee1c85b51a1dfc416353fc42bf6c3b6eebacf81"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.0/gpk-linux-amd64"
      sha256 "354e83de0db78ee049212e2a6c4da567bac524e95090c59c8ef376eef103428f"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
