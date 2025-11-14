class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.131/kittycad-cli.tar.gz"
  sha256 "2582485007d3f5c0b3e507b5b016054c735c6529aad94d1a53cea1c2b937a292"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "c3a6d7ef8b6a8b51ad6bbda4fe0ce6c0eb0dfc027075d785d52ec4ccb523353d"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "ec5eaeac88d26afe6c90f002d7f8055f2f76aad0a373bd7be7bec57151263cb5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "cd52fb04b373ea0e3813ce5ddccc0a68b9e008995577a6153455f0218f3b9d01"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "8b9f5bb8c36d3b06245c7b4698b7d440b2092d7e0794d2980761e00fbbd58382"
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
