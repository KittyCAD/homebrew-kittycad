class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.208/kittycad-cli.tar.gz"
  sha256 "ddf8feb57d3633f882997f2822ab43659dba826868220e98f4cfa0ca79cd925e"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "94f155bf785bc110fe3368d1a6f9236ac7301c07818f9be4fc59afc7af1951ce"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "9254333c389e761f70709a43f0274054d89c65c5c0f89b72171afd300329e76c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "145d3c49c2d02dc615be78e24e95cc14d669431ea35ae0b9dc05a316c04f6bd2"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "af9473b50eca67bff4fd63f1f7d5e0306e2e234187d1cc9e027e8dd9d2389f75"
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
