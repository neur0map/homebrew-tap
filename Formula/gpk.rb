class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.4.5"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.5/gpk-darwin-arm64"
      sha256 "d9ad595408389f8e0c3dfbe7a5e542be662fe041d1b5ecf4ba12f65d11d5f2f1"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.5/gpk-darwin-amd64"
      sha256 "3f14da04e90942612423762992f1b908f9ea44782a7004711be846c4aa7bf114"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.5/gpk-linux-arm64"
      sha256 "8e285c6699d78f2e6ad43545d82e3f0245d9a7a3618443f52655eba478d2221a"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.5/gpk-linux-amd64"
      sha256 "dcf989dcf66e3df3b22b54f4b1399afc7221b3a36c1277f285c3708572c98dbd"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
