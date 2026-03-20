class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.151/kittycad-cli.tar.gz"
  sha256 "acacc545751ba6055467aed5bad7e03d898b5cc914ea66f57de3b16163216c62"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "8863fd4a41fcc8ecc5a9969c371f602f0cf1b125e44cb25f5669288bb40b9a0b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "d0f9970fe3bf6039e225d33b3c665094297ba6d4e1521920c28902954bc764be"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7c3916cab8b28e64add8e8e0132a0f5760cda2f5c2a4f593b7adb1f032400eee"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "74b21dc9c4811214a5beb382d984d83acb6c1155091b2bae3fa1a09133a9121f"
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
