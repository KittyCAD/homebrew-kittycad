class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.162/kittycad-cli.tar.gz"
  sha256 "bb4e58edaac67f83d418d7a5a17e1464581c82a2c3dcfae593e411fc39b699ba"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "0debca6538a6d9b8f652adbb3d496e0ca3289c31ab58d40ae5c16d08d2dab75b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "d12e1bbe2d48311cab3f78e70e6b2f8aeaa6746e6468aba1c1a7e07d1755d045"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a900cfc6193887e7db24cf8cb4624e08be8df7556ab14cd262c749d24651bfcf"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "0418ae65fbad2d62a04632648be6c30a8523140a95817ad4635bb9db501b38c2"
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
