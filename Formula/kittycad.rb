class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.52/kittycad-cli.tar.gz"
  sha256 "cd39e216d7a9d21bea5cda26bfe25af835e4292055d5f9c8011c9f586c6db2cf"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "40e31b694c09af99b6cdfe5a8b4b48efc55f7b9df523b5b314094f3d6eb5f1e8"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "485b43297be0d40c3eb35703dc3a62d7a14ba284384889983031d3444e5ca0ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "12a5c1643ae7d70c9f9a097413fff37ab2154d8091db21cc8f29c1cf6c07686c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "a0fbbc4c8e5a6c2f8f167bf124acc884d434d64b4efc68945b8c850c676ea442"
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
