class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.205/kittycad-cli.tar.gz"
  sha256 "5556f30c2a90002c1215f0615c226154774763353571fbbbc7e1abc8815ca8ef"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a94abba52903c686fcf9032cef0fae3e82f9c704ed5bd45594d3e4fbcd9cd947"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "c4f072a5080c045c7bde39e92616d350d75c25d27bd7523db9bbe960d7ba5756"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a2b023de1a9ae6248db782e503136b208f1c9ec24fcb67dc3a4f09c0065ceaee"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "a3d32fb1cd2079b9dd5b49e905a725834acacb46fa684d00798dea9af29772be"
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
