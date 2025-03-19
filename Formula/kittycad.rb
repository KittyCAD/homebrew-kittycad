class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.107/kittycad-cli.tar.gz"
  sha256 "e22f55f6ed692020c1374bf77f16a5337dea25fa4f6057fccb3a5cb95fd9bc9d"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "795369acd8fef391e29ffb4a4a9931563b5fc2e3f833e773c4f4ffcb1682c3f6"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "9796004e5a79fee3b9283d3b8402a5a7ecd75e30aa1729ce65a9bb4b76993437"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c47379fe036b2eeb21f76ca4d462f90209d9ef78c8b6dd5e6b7ee245743eb399"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "2a45d3f4ff358a144fe20e4239c6ac3d9ddff9078e9e0fa5ae344d58a976bf24"
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
