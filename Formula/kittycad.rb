class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.63/kittycad-cli.tar.gz"
  sha256 "7937fb49e8f48fd393461878d87adabd0ce3feeb187e1a0764819d6ca6505c99"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "f36ec885f45f1850edd0ec3ca1b0976bceea4d851e65331af1aca8b735d6f7ed"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "b3a6db595095e8479f59791cac4ae8e68e85ec3025507682c50e3c8fced85211"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "4f85e178c5651ed97b6a81f4f963d79599e67de8037c1fc7c65b5f853c1620d6"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "d34c088c5ab6cb1f14c24f2607628d40df913cb9af5b5ebeb3d2294d2075c98a"
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
