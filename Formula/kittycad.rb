class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.111/kittycad-cli.tar.gz"
  sha256 "d7056629f96457f42badfd4124bafa6e061bee01d7211f8e053755867bf4a5f9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "ac601d1cd37c17ff20d5c5a33b961b0efc1337983ab5421783503a69c9af36cc"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "bb28006cd2bc052e37b997f3163f6f8c06bc1e82ba496a41de8582449c508755"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "6e4254249c76f040aefaa9847a0e47fbb56c9d284a03d3abc55a4150199be112"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "b7f66a98580ced6025c1124a56d9fae56ad7c43aa8297f100656dd698cfce1e4"
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
