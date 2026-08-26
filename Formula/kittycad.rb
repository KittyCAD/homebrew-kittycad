class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.191/kittycad-cli.tar.gz"
  sha256 "052f8b711ce37561e59b96031b6f411e53031f4f7cf731ae208ff78cf4fa3e6e"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "e580bee84f3398c8baf95c3dca03b877b34ffd82ea72c8f44b253f5ed40afb21"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "a2969a44922676b817e5ac5b4d996753aa438a1fc16c18ac3eac731ea73424ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f34556898781da2e4aac491cb6798ae0e6fee7d5696012159ced5e2dd779fca2"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "a5c53e4d8f69170c7e800e4499c3b30219d01f9328396595706d43ee32f5729c"
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
