class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.84/kittycad-cli.tar.gz"
  sha256 "73d7156168483e7ca6c8599f81ec5cdf8223225ecf7a5abb39b07d3834263894"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "8dc95ae59aedb65b5132ca1675f13ab24f498381e0153fa259e79dde13319fff"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "fa7ff7ddb62c287dd6c1fcf19145c52faf8647fbdeda5be68fc8bb086e2bea51"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "43eab4ff00c9a0ab8d6037b0fd59fd1a85bceabf870df2324b1fc73996abfabb"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "d92b3073824104da97cd93287ba365f6f2f4ec9a98a821b48582fa2ed0e367a8"
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
