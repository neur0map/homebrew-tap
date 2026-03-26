class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.11"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.11/gpk-darwin-arm64"
      sha256 "7082cab5a4e55d03a42fb94b31523978b877ec9e55355d9846665629c5305de1"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.11/gpk-darwin-amd64"
      sha256 "dc73d85df1d3c73a9785b776e287f7160ae14f2710c7272ee8884cc0734b25ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.11/gpk-linux-arm64"
      sha256 "b199d791f4aec0713e1a350c8f18023267ccfad0be83dfad7a138ef5b944f08d"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.11/gpk-linux-amd64"
      sha256 "cac0211a454708c8d6b17a5818ca16ee0c22f461b168239cd94377313fe21416"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
