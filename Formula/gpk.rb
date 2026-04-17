class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.3.28"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.28/gpk-darwin-arm64"
      sha256 "2c750afe65d7ee339760cbc2294c0f342b304a3e0055b7905c5d8fd39b2627f5"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.28/gpk-darwin-amd64"
      sha256 "d6a39ef6b125f91ae485023e481066eedb7e25176726ed6c60b866e83ebd6127"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.28/gpk-linux-arm64"
      sha256 "9fc493bb9bd27be24ce9fcac1c59c841b6f9ff0bf6ca022a3752b633efa175c4"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.3.28/gpk-linux-amd64"
      sha256 "82d7b9e794bf82022344ad496ed533b0cfc550a1cecb90574157acdcaf960d4e"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
