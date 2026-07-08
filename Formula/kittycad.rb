class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.182/kittycad-cli.tar.gz"
  sha256 "0b18db4f089b1b5df7e5199dba1919d367960347c498e12b8b6350768bdb49c4"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "9888a478dc3b5bace606c9dfa44347ecef3adff7ed8d1b46c3b9247037e0288f"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "69b2d6b9b6294cadf8a0ddfcbb1a094a2260b3f7d95b969c4979fdd294bfe6d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b00f679da47f1068b58d6803478c3550f87ed10034a8907427d2a78a943df664"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "82f89a23811d92665797e644bd1a6f874a11e5a334a10b68b55bc17918636fb6"
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
