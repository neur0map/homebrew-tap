class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.23"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.23/gpk-darwin-arm64"
      sha256 "fce7c8a47670ad6bdce5289cd72df33868b46176ef15c55092884a06429c089c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.23/gpk-darwin-amd64"
      sha256 "62718347fa9d616a0c4b3a9c8ee947a30431f874f805fe499aa57f31137baac3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.23/gpk-linux-arm64"
      sha256 "805e5047a485fbfc2d7b7f47c7424ed850549f1ab7b60f71c8b4897b4ded2ea6"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.23/gpk-linux-amd64"
      sha256 "df967c118dbe88fd8b6c7bb84ec33c84ec09ff320038fc2d39712172caeb7b7c"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
