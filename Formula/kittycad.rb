class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.174/kittycad-cli.tar.gz"
  sha256 "f62051ed9858557db590c9ac91b16227a5a16180735f0c8c5aca67632bd93f38"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "707c5531ead3982389592065c5d18e9e55be202c0d2af7d14b421f8951fc542a"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "21534c8ecf5ab8ebd197d15f02efde7404292e9145c9276993b6bd2d69e31c88"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "bd6921a79b11b53610a22ab81531e6f541f6b07cec9a424020b0adc52a3ce1c2"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "111f7f9080c2bd63190a02a9c47a4a7df9a23a69232de3b83d73c526305fe3b7"
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
