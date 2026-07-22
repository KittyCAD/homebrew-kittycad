class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.184/kittycad-cli.tar.gz"
  sha256 "e1efe2dac064403d0450257df5265ebeda97943d1c06566904f05b6c5c1b4c76"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "d10c76037911d38476054f811129300ecaf0db6dc753f0dac4645c44b7e3c47b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "f6d9ac63ebc0e81c57aa37352b36e1d35f3d8426a07541da5f9ae4e6ecdf5043"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "804f5f2c7c9fbc983b8bcd14c7edcb62a1263c2dd523826c8af2c5c84b527095"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "93bb8a875039fbf9af66ed503fbe1af887a7eff4df471397319d54315a27b4aa"
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
