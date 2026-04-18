class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.29"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.29/gpk-darwin-arm64"
      sha256 "060a34af86b306165e3ac3c23ab6bc0536783b5fd6c3b053e100c445108ebb2e"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.29/gpk-darwin-amd64"
      sha256 "ffa04052d507a92a024b60f585d0ed61fc739f0c9fc4e9297b0c37871dd8c88b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.29/gpk-linux-arm64"
      sha256 "247735ef7d3ae440d42d50fda32a8d5c912c9742540abc2a1c9d366520e190d9"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.29/gpk-linux-amd64"
      sha256 "10ad3381b97b918aeda5d4dec9d9cf4f9b7707c17060a87d26d47e452bd24d68"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
