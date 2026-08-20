class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.190/kittycad-cli.tar.gz"
  sha256 "aaf3cd235c3f39015bb5bae842c9adac0c176c8c461d0cd93accd0e87eb0357f"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "cf7dbe4cc355d8b2d9bdcbee1415f5301dd038cfeeca44e3d9e6072372d2dfc4"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "61d60c40fef4885b27201423d72721041cf22e7aa06c33b056b7e3cc41172143"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "aaf0f1f4a67e0aea30cf083f19e8bd4e9f7043f74e6bb03e477762b29d530ebc"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "1da83d472a8cc42b7b718d964aa22630225db128440203b326a0e8f442a59325"
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
