class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.129/kittycad-cli.tar.gz"
  sha256 "c033836bfd3c17fdfef2ea91e52e962bb506a364b996b46e28cd20725df7e3d4"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "7a37523541f47b856d31254c8a7a1b1f61f017731491a25ea4def2f2105dbc32"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "746174e7d210962086f8a2615cadf64b4ab8baae4c886037e264708d81d245b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f5821710ae50531c8b9faf31bcc3f783682b9e74cf90f12540f7b4cb59d4ad96"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "bd99ef8d9c6eb18b8b71bc73c0e429b65840b5db5f64ffa5b2851892cc35c4db"
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
