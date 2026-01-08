class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.141/kittycad-cli.tar.gz"
  sha256 "f51bc493701d5354af3fe487eb261f4fcc88a37d3d4d6cbb2ab59fc3605d54ae"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "8b06807580795cd1bc4c15170740322ed4eae18ca25c7e62a96ff1c3ce77fbba"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "b23de8d602f89e855f544e205c173222d9da31e746293ca385e0e76b40ba5003"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "74933c6ba4dc4a9356f397d2b724ae49a9c47889c20d51c0819b1a3e29ea2d9f"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "e7f1ffb8e8bf3ac4ca4d6acc3790d3596e787294c082d3e7710bd6f9c66eb0ff"
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
