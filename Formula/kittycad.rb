class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.189/kittycad-cli.tar.gz"
  sha256 "dbb5b18d28195610b19077eba40542a40dc87d60c12eb90ac796f43b35bda0b2"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "0206f6ece5d940e4a0b5474834fe2c9bb607afe828b0c310039cd1e65c2e84fb"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "bbaac207fb6e54fc034770134c84300de9486f37d57515d4d7adff40d95c1b88"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d4506b016c2b817344bbe1ba94912aece11f3255ab8f3bd29b973ecc9197bd01"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "9d33d03bdc176b0db099bd46c15f299b026d577381b0a395fabab72fde2a1ee6"
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
