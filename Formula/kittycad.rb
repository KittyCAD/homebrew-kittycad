class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.124/kittycad-cli.tar.gz"
  sha256 "ac12f854f855881f3903c574046a47d72f9b2ae656595d27a8b3bc9cfa27be00"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "e25600864f1b3e217e40d44060cc8c159a997ae2bccafedcf9028d5152c846bc"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e33c7888616e2696abf6b0eb20a602e74f67d64227110f1afbd7cde5fa887991"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "82e0dc4111d5b407758356babe6f8da6bfba491e5df7f6f65669d1f450993eb5"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "7f9d2c40dd9d7c52f2aac9a587ba2ae834de50221bf7da50246152f2baa26d0b"
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
