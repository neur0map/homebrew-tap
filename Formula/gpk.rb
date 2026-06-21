class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.8"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.8/gpk-darwin-arm64"
      sha256 "a0447bb5e3c368f84a82496fe3a53f4e5ab9b600498a72b49e7d555f85b32380"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.8/gpk-darwin-amd64"
      sha256 "20cac051e582456c988ab440b8f7621ab4c5d70fe469efd0dafd613eb3df2dff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.8/gpk-linux-arm64"
      sha256 "e31c6553dbc1db21de4e8fdd7615e194e8e2e46682b296a416f520113d8dc8b6"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.8/gpk-linux-amd64"
      sha256 "c379780e9b5352a0b1e59f7d391a1c2c01e09ab5257b83712b3d5aaa6acad3ba"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
