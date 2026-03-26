class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.16"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.16/gpk-darwin-arm64"
      sha256 "a8306b2ccbc02201c475086e2761195ecfbbe4d176c02c7288b416d70f201e1e"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.16/gpk-darwin-amd64"
      sha256 "574f6a73cb948dcd8475a4e9f6b046ab17c9ce6bf3abb6afca8299ba9ac9f375"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.16/gpk-linux-arm64"
      sha256 "b15f75e8573334b949f2d0bebd409e9ac25b30b33ff4222004dd566a50a4a696"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.16/gpk-linux-amd64"
      sha256 "3e51ba7f272a930a3c7f6c14c77c3aedae9744996a1f12896add3398b986f59d"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
