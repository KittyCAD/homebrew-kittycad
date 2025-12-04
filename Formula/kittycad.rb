class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.135/kittycad-cli.tar.gz"
  sha256 "dc260e40fd350150ad939c7df6204e8e7c379b850c583064cde56c3b637e19ef"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "8d650de92b14ed4d2998ccb6353d20dbd7ae38830c42f57378367e02dbe20bd9"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "c6fa85dc7322869c80ecf2a095447ccf2dc81166dbc38f82856d85e62cd99c95"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "cf1795214ad8054687904055309437dcbf18ded035fbe4f0f78849917679837e"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "6b984b3e2959cbfb737f80930becd3bd40254f28e98cad1776cf73eaaac6bc86"
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
