class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.5.5"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.5/gpk-darwin-arm64"
      sha256 "92f79c1d633f00de249e70a83333a3604c87d39ac64ff4e667e3ff9ab96fecfa"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.5/gpk-darwin-amd64"
      sha256 "504d15e34aad8a4ed9cbc6ffd5c37d0fafc270b0e0c23569aee4e62e95e17a78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.5/gpk-linux-arm64"
      sha256 "b8d8c3e99d5d12c05b451528e9c7455466c5ceca5b1073e80e4b232a2bdaee3c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.5.5/gpk-linux-amd64"
      sha256 "e72f224b32f9715268f5d86e0e165f817eddcb0f6223777299c8cc8966e56297"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
