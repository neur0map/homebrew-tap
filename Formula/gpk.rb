class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.18"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.18/gpk-darwin-arm64"
      sha256 "91c372331062cc347ab5cf4ece170cfaf9238d0403092957c589e3d8d1a157a3"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.18/gpk-darwin-amd64"
      sha256 "6faa185ddd87c79e65a9f43dd88b0ee300f1a54968bdb6b22cae392aa8a9330b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.18/gpk-linux-arm64"
      sha256 "cd625b57b095b9fb3e6c70dbdf77c53c63b289616b9f5cbea7ce4122c13f0899"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.18/gpk-linux-amd64"
      sha256 "cd974adce4cd8c41f4d12402c77de99b61e6005b6c749fb3e8dc0eeebc1663d5"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
