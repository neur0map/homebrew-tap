class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.7"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.7/gpk-darwin-arm64"
      sha256 "77de6f88e64b21180fc635ccd23c823732d22603543310c39e3341e699b8cd36"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.7/gpk-darwin-amd64"
      sha256 "c57090d2735f2a6fe7160f87217ccd35f8875710e43908bd49f0910a3fb33c48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.7/gpk-linux-arm64"
      sha256 "55ad8fe76e7ab3cc15a3f0c2bbe2dab5a86f7145bfaad5594e139420de7bc611"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.7/gpk-linux-amd64"
      sha256 "f9cdae9f5cfe78056300d92f3fda2e32e8acfc5a572ea08a59e51aec1c31809e"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
