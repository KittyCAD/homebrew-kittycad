class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.87/kittycad-cli.tar.gz"
  sha256 "e7167774c5e587b47e948f7b8f27f7b18f4e5ba708b265ba9ad80b866e6e85b5"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "0ddb7e32d13a1e0b2d278f3dd48108c09f26868a7a8328f2618db43d1d98e518"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "a1e4f3b5e1fd5ba6961e73251ea425da646415e03d545839964ac89f11ddae13"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "6b82fb31e3425e05f4fcc3b195c767412d57386cfec9034f909df2dacdf57b62"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "5ef134d2e6ae9c21f6d7ec356c0dd96be72b4ae2ae6c0a3d922e5414df354d3e"
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
