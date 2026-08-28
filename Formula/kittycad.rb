class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.193/kittycad-cli.tar.gz"
  sha256 "e4d9dff6648b37c5d684f5ca1978c23a2114d6f55a96fb272e89a789e952bc40"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "95d4ea1894e4810e655059ea7db7037d12cceb50489619ab3e0aff6f03cc7dd9"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "156b2d7adbfc3fa004d9154823b1616cf60efa4cdb5a2b6460086439a205246c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b6873fbbe9825862ba4fe39dd34e6bbae6c8fba80063046daddee6871d05113c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "866e2277ade6da8b38da5c441305562287ea30c0f9adfab011493b6ed747e711"
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
