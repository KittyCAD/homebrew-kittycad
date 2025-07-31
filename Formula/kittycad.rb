class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.116/kittycad-cli.tar.gz"
  sha256 "bac4eb96516967ba9bc3c22f58d249620b9726b76949012e4479106b45811f26"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "adbb49ab32528bf6eacba4105ebb10d4d5dca835f726de78da72565ba4de4e6c"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "01168699bc2fe0cbe1d006f82d7dbef20e6e7bc715775e168801d6730df0d1ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "ebcb478984269acc283a1040265ff9581ed716306626027df81218a31cfdb6a3"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "32a9f47bdc87356f5f497bb75f832ae9505b4e36b9bc2c95dc3ecca3fb6f3456"
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
