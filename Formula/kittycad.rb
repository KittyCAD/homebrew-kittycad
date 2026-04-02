class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.155/kittycad-cli.tar.gz"
  sha256 "b770a4dc233a2bb841bf82efbb318584e219daf319cd8bb979600e476a2c3d82"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "681758d2ad5fc9a6689661996fd87964d216150d6560599a4f71305ee8c1f0ce"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "cebcd967d8899a70b75cd2bfff36561fea61396e99767cdccd1d4af1c0c0d69b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "8c53965e902a4027d883cfd263986807c3f23e1199cb66a88814e7d9d16208c6"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "a7f4c53c990353870bc7d693d9094b5801a79f33a0d504e9fc14fcb9e7cbd923"
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
