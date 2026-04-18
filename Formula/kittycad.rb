class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.159/kittycad-cli.tar.gz"
  sha256 "bb8ffcd2712f96f5b9a283f902dc7a99114b9da0e24def86b58debe688543d13"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "fcc7eb9ab98457138052de43b556329eef16e1dbf56d1dad6b9bb8523509e1d2"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "6a3a9499861ddc4fa528f04839a5ec18c8970a01e764ed9ef5b01a8d4e85be3d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "379e537a018e323ad3bd76abff759522fee1f657ae59147e9c7d889c61c92b98"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "21608b54af028a415bfa6bffad9b41b803e5703f71b2c354db5e842657457695"
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
