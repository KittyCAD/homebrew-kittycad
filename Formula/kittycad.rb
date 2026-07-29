class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.185/kittycad-cli.tar.gz"
  sha256 "d792b9be7ec34086c5fff70f6e59d83aabbce401baaaa33a680f48290023cd24"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a2d541ea0ff501b1092b706622577fa6e06a376c4a4b584cc0c5d175c0f10af3"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "9a8b7df8311b6c39655a934404c7bb020d64497012710079cd4ffa8e474dd5a2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "6811d123301a0274e01ad4c2ced88fbffdf1a70f7cdab9615bb9bceb408b1e20"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "18a0e8dcea3f5a89761b28f15d387302f9cd874dab0a40f740a6c2260806d7bc"
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
