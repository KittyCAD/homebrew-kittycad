class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.113/kittycad-cli.tar.gz"
  sha256 "95ac97c20021b3d40dd157c94a2459ffddbc9d95a4fe70a1361c1c7e034a97de"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "01b963692ca6cd51996572e74d7062739cf5d23bca82c30ab43deae1fc782ce9"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "f7e264dfc6216dfaf77bc7290df89ec30c0f15f11b0958d0554f014f6088c87f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7a82412a8f993bbd7880100d34703e63e040f028a9decb236b5b94737b73068d"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "cd7ed336f0e965a3539a963bb77529572ec8abf8d3cb7ec0a6c1364f0a5da9eb"
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
