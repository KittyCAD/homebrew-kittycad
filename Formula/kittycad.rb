class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.171/kittycad-cli.tar.gz"
  sha256 "48acdb43ed36ea62845de41c328381ff2a9f6330f17f6f44c9882c8b6a060d03"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "97b12417653153718093745dc5be29818df36b60532772477c7f1ec6477ffd5b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "57b2611ce78002990d25e932d14603f915af95e6d1cc708de47d91bcdeeb7d14"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "07874c4d2bfd981f1a65ee25e2cd65b43d83a67b3970977a62368c9694a4cc95"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3afb54810be6339ce7bd4b1528e94e7a22d7e97d4f10a44298151c6f26dcae9d"
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
