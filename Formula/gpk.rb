class Gpk < Formula
  desc "TUI dashboard that unifies 43 package managers into one searchable view"
  homepage "https://github.com/neur0map/glazepkg"
  version "0.6.10"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.10/gpk-darwin-arm64"
      sha256 "7b58f50d79d84d0546f3cf9fb4718ecbb6e11259cea65952be171c5cdfdef63c"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.10/gpk-darwin-amd64"
      sha256 "59e09010e158bf186908a0e9eca60c1d248ae85db13b83a7d5457aa20d02dacc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.10/gpk-linux-arm64"
      sha256 "39c4590c65630b134c51e34cdb040819a52513aaf72fb41e2d549eac83fa945b"
    else
      url "https://github.com/neur0map/glazepkg/releases/download/v0.6.10/gpk-linux-amd64"
      sha256 "b4e43c2428a3c680f9ce97855d44522e18cfce4bb933e5e622c52d3db17a7be3"
    end
  end

  def install
    bin.install Dir["gpk-*"].first => "gpk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpk --version")
  end
end
