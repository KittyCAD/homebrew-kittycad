class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.99/kittycad-cli.tar.gz"
  sha256 "d8c1aadd4834fda2ce40519cdb3ebaa8b47c6fb36c8da3dd5e3fc889994046cf"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "80f47be1c10a74ef0ba6c2024086132b5d5b85ca83f00e6daea5561658230bf6"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e9a712640191df9b5ec08d736a7393fef0a63016556215ac72e5268fa5059fb9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a1e570832c75c09493834969b7118d4644830ed652ea4b6f7cb4f7940376e0a8"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "fae942481a1926a9d07f69ccb708bbb23a5dd3d62b4ba2dba942d9068aa721d5"
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
