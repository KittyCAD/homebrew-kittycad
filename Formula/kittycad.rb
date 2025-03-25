class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.108/kittycad-cli.tar.gz"
  sha256 "8d45ec8da82050b7a505ab10c6c288b72de07adf0cb1df175c41c5b0113df017"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "16e025bc99fac7aaba3bfee45dd707f66f100164c1a1bf7960f172fd3bc2b167"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "4914065edd455c788bbe301dd05dd5b6ba48d0f82110f55f6a109674caaa6e39"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3c974dfc7c5b78c7aaf46c062c28e6b3b085915365af687e1bff8a82ccceb314"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "6904b7dc5d366bba23a748ca409885fe732a2d77471225468167d2537ea0bee8"
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
