class Gpk < Formula
  desc "TUI dashboard that unifies 34 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.4.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.3/gpk-darwin-arm64"
      sha256 "df067ddaf63a77a3d55b216e88c86a454b3324090f36f1286401a3b5bd1dae87"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.3/gpk-darwin-amd64"
      sha256 "b54181f293c3bd6238259dc15ade03ce98c5bfd2afa6a82fd8954912e0a8ddc0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.3/gpk-linux-arm64"
      sha256 "86267d9a21241d0639422261b7adf5504cade73bb8f3407e9ccbd4a84d908373"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.4.3/gpk-linux-amd64"
      sha256 "c8bb41fac7b347d3b3785de6884a8bb42e53ffbe29778f8ace2500a3016ab422"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
