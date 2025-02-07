class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.97/kittycad-cli.tar.gz"
  sha256 "33648be9a980ca685f0908ae95c7d5512b8d7782ad7e7b2265a735d5aca670a5"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "cfb97ead6196a5200b3b2a6115151b96aae8ab6c39c41cfa5350cee72b432cda"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "785a41868bfaa60e4ed67a604283d54fb521ce789df0e809ec89cb4ca94638e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "414c5c5612789297f38000371778abacfa082ec5caa738a6cda56aa1a45a89d7"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "1ee8c9dd81ac7366c960a0679c2d33f9af5797c42bf3e1c973ca033e998b48fa"
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
