class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.110/kittycad-cli.tar.gz"
  sha256 "e77855bf6bb7397088a5526f84f9bebf1bf8a270f317ac8bdb510c3c6d68b620"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "2791ff32a99731243d1f746556f57a8fb00cb905e825331e4c2f7357abf13890"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "9429445868bf320457bc4b2099bec8244b7f38b0fcbbad75739a280ca317e119"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d3a383b81c7ef5bcf90ef04f141a0e01f57a3ed0b8294ab08cf33eef934dca4b"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "467f694da4c90363c6832b318da96ed71abe97ef235a01b9e06db8f0f7e86317"
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
