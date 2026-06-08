class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.175/kittycad-cli.tar.gz"
  sha256 "40487e0e0b649897103d81654f0b3e3d4df4b5d11c206012be4f521fe7cb1688"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "5d7559c43fa4589e9996f2e9b99cfd1749e0460fc7541bf02d2f12f7b9bfb036"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "187b421081c8753ba983f4ac809ff7cf020054ab4765f5c6e4c0b9300761ee8a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a77e5fa27033b3b7e5bf05c685abc5240b976e9f0d65c125ebb999cbfbf4aa2a"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "0d1e2ba221be05565f1adafc16c4a5bfbca6981bad0389f527dbaed691c366a4"
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
