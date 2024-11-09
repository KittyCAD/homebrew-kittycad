class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.88/kittycad-cli.tar.gz"
  sha256 "b8d3479396d2a40d2ee2053b679a65a4c76618ab683f832caf86291c7274c82a"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "894323d660bc3cc6d44a7773c786da9dfa7a4c25bfe14b017de4be65585e96a1"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "3ac59b0aa3782348b32f416445dffb60f6b3767a97ba762e20a0e550cfbe2f60"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "6d19d7a619d4d254bd6c4086935129bb8a8ad2068d3647200760f4568b728149"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3dfee02c783ec6d12d62506e205140993479e0f8b4c956c52829e201d8adff4e"
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
