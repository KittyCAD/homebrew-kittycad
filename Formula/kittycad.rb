class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.90/kittycad-cli.tar.gz"
  sha256 "f9a83ce89d8f76e72f04ad2319252835957691028975e5f8448845daab5a4bad"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "bd4654fea19668dd2655fc0b91b2d3429b9118f898551854e1637779e3ebd184"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "c5c480b2c2dc323887d668a6e681c5065aa2574f460518ed3447b0882d3fbab7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "53ac325e6dfbde8c8df4c0055f96bc1290967e3db0e0f644954aaded8a4bfbe6"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "fa0df67b33e73d0041be33111eb27fe443fd7869cb24818d7a865f48ccd1e528"
  end

  def install
    # check if the user is using Linux and their hardware and install the appropriate binary
    if OS.linux?
      if Hardware::CPU.type == :intel
        bin.install "x86_64_linux/zoo"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_linux/zoo"
      end
    else
      if Hardware::CPU.type == :intel
        bin.install "x86_64_darwin/zoo"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_darwin/zoo"
      end
    end
  end
end
