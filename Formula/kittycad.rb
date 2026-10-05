class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.202/kittycad-cli.tar.gz"
  sha256 "405d6e5d683825c2630fac10403d0bc63bf0e2c240653bc584cc39b092ebb079"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a243b3a038ba6728c51ccfe898e9a1470e4442ab001beb60db95c4f77352f4e6"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "2f18bfbfa380303327d5e21b856703248269783c6174379ddda870c872b35284"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "fef7f6d82beabf6262faaf243668d5154667925b16c34af7c45a567e172b12e1"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "b1828d4f2c2b95ba6fe27ca59acf354155f54faac6a932686d94b623fc5fa424"
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
