class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.137/kittycad-cli.tar.gz"
  sha256 "3a6af8934de366358c5e3d6dd2ee4b673ec5af768e594883ba863a7554326508"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "270e01ec346b8d46d886dd8f40d1cf265d5bc9f024907917efb516d6e66129b6"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e54c61079d18959f9523cf86a0a03ba13a9ef6a590335c07a49f36b8e4a37d15"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b13a3c70087fbbb9cb2526fa73544a89c537efc805593a143fd6ca2a0972c73b"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "e4fe6236c1d0f9d0906ffbc346b4761174b78c82c4ad688f122461487efe6054"
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
