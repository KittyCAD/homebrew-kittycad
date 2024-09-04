class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.76/kittycad-cli.tar.gz"
  sha256 "ccf1f990c28312ad4007273e74f7daf965b6fc87d4f0cf211ab1d06fbcd212df"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "c2b3bdd9c54f78d14d79c8a01c825c76e449e65e91e6a5d5013bd6079d2d794e"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "6dc099a5c623ccf991efdf7fe76f06f14091e089502c531d4ccdcb07796f41f0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "da661c609d571fa37ceb776ad1b62dc3b8773ff91ad56c133086fde0c783d2c8"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "084669eb13dce94a8e6d6b0b971e613a132111aad81c299a5a5e1859f2765533"
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
