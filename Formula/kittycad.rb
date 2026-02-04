class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.145/kittycad-cli.tar.gz"
  sha256 "df2ffbd396ff62b18e9c27904899a95d55fecef6562ab4f97a8ebb678581d476"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "9cc9a0994b821859328e2346802af2bc57ed2b2860a03619f9cbe94f0351a7e2"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e474fa10e3652467e880b1f5d3f8fb9d551496b640967d07e8fd0dbbba875f35"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1dba7d316f4105fcfd627a9d2ca755ee1e78088951df312a83e879101b57b9e3"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "7c5bd60332860953dcfdfcaa9f675cdb01d6763768298280946ec3906a9a532b"
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
