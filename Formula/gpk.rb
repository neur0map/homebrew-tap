class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.24"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.24/gpk-darwin-arm64"
      sha256 "f53dc48b896e07f459cdc2bc56ddacb8985af2dc667651ae15b3966b2f010abc"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.24/gpk-darwin-amd64"
      sha256 "6e6c76fc4b488304273f9fbcd01ce545d92a766c08d25df27198522db63ded5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.24/gpk-linux-arm64"
      sha256 "b020fa113a94ec6ea44332792dbd3bb43825172b5834a3caba3c60dddf392c5c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.24/gpk-linux-amd64"
      sha256 "542ab6003a038186207b9e01a3bb918c993f6362abfc8f032661d394069da688"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
