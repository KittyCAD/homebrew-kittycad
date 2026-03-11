class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.150/kittycad-cli.tar.gz"
  sha256 "7f2a97f57322dadc48f416da134da015afef7f614d972bfcd24b86357d8ee4f8"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a0937b248d96ced7f13ebb0506f94b705e90874a5b99428cd0b5ca5c42b6db70"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "78551332d847b29bf28e43cc8d0eca8917caf703c8b456acdd23caf42c3b6910"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f24069cd8733c49e62fab1103760e36820cff532e93cbed542fa9576bd36b41c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "ee05e471d84ada2782cd2eb5d2a3a5f698287f2f90a3b0bb548b493606bc0fda"
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
