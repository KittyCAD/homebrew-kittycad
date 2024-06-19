class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.54/kittycad-cli.tar.gz"
  sha256 "50a699c820991d3a90e6270da00235463b6765917b57f6ca2a7f2dcb1a241a05"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "4dedcfe5620418caa9d9e3977aea440824d6f12f749225128261a5eecaea5bbf"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "fb324d04cf6e96630bc37c7331164ed40769667833729446b10cef94a90787e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "124033e1a8e9a09b70999de3aeea3b2eb780916fe4309264745fe63bac6d9852"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "39ae44411be552ffaab20ed7e249bffcbd638b86cd23602c8d84bc413177f33e"
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
