class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.122/kittycad-cli.tar.gz"
  sha256 "c6382e97cd26b784b37d6fd977824017ec2b13698f3846133514ec2b1962b2e2"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a622c401a7043e6ca072b1f857bfb5ee881a0d4c7ff0170c52471216b4b35577"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "045efcf77e97a1318321aeca97e61e6365fc3d3fc60fd1212dfaa83e453d50f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "63e8e91ca85c1fbcbe5a92c6afcff8a624ad284f697d3d19d92699286a5a0dd7"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "5ad99163f7e564bb5eda7e622ffa3559b138c282b63d5167ccedae3ed838da09"
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
