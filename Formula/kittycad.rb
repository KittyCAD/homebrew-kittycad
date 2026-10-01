class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.200/kittycad-cli.tar.gz"
  sha256 "fb8bc74e2448a40212424ebe11437bd3e66ba848d58e1df9a6e9356a7c19f229"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "60cd3a11f98aeb517061e51a7bd808eab0e8d0d827bb4dedabd41c89038d87d9"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e8b0c3097e4c4b0e76498fe18eac4b7ce9cb0214b63f24f3eed7440a430c2fea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "bc40229919786450d76b43ade4a5b744e7d4459592a6cfef8f68cff8c3b7f76f"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "52e21b4cc4ed1c464372e06952d1cf3acb4f79b1971fff3efeb4752745d494c1"
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
