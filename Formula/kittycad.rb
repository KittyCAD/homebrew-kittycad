class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.85/kittycad-cli.tar.gz"
  sha256 "5e68023faf2ce2b14a526a78c0e80a50889d3965b4e2bd12d0a156b4585822a6"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "0e964d29393d3036a431335554d6c14cee2e104026d765637cc2ba32e77181ce"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "25c3745e963870830529cee49fc7fd0cdf0fa8f6be78d5e02415966294654a15"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1f0866f0db5bd7fc7e66022531ac64c4c5d563eba13b16d0bbda73de295200e0"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3a9e4889d79fa343ede342c3f155ec6bca1551913f5bc3f4d693ea867a28c7f5"
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
