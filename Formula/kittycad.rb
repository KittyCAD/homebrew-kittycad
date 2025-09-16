class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.121/kittycad-cli.tar.gz"
  sha256 "6f353a8fd1e9737518135ced30f95a8294c50f15f12fba46f37716f8c12e3cd9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "894d190b653e7219410032b2e451f15a1f30c84c22f2a54e6fd4902c50c1460a"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "422e26122ad854fb95734258dce88a37b1f63372684fa3c5fb9ca66acb7d83d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7edf771c26808af717e970a552168efd10ef07cf5d1d64599d2709b0e68b7116"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "9b5c16d68e591e8b5f6a846006a7ea2268064e801275980e6bd53de3ca9a60e9"
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
