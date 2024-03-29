class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.37/kittycad-cli.tar.gz"
  sha256 "eee2d23cc893ae4c9f18ec2fa70c60a98c2c205d62b45076f17d42ccd59dc87e"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "dcb8bc296688733a89377f119585e33473f0b4bf3f13173a06d47718c32a9195"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "807622d2479dc03d0f280c4ada7d247d6c286b1199e7336a3949326cd3917199"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "ff9d06a8540c73851c04a1f924404159782d9e4f9986acea0b38788ff19dda53"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "5b27ac94993c556026660bd9159d0861e2bf8877de49152b2f8414fea740c6cf"
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
