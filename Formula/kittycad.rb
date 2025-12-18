class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.138/kittycad-cli.tar.gz"
  sha256 "0b9366610d6f83e4d35ce86f4bd6a2d9659e0b44ff58f3fc39aaf69ca1c78016"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "574f2cd736fbb98bd76776246d3eb6c903ee11c6f541f3cce31c7c624e94a071"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "69683c45ede162a5f67b8838dd2f2f7c87bfd0e08fdd800897d39b0eed3d8f63"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "88d7da81dfdf5867694ba512a23c0131f59289adafcf7ead8005f04a4ca96004"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "264f4e964e0408f25cc2dc38add47d78ac7ca21e6d5d0e2f23ecda7a1bfe85d5"
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
