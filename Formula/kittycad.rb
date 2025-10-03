class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.125/kittycad-cli.tar.gz"
  sha256 "cb8b32f96b2f7822d86b99381858fe3bb440979487b00c0a1a1c6b01841fc3b0"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "9dd0c097ff1469d61f9b134a84aebf3e855e25814f2fd7f828bb28480c91fc02"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "c454327735f722024c0e3b274ebcd17c20f0f27547611a7de623ddc02446cd85"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "966e9012c3624b912622457abd5bb2590f0d9ac55791e6ce36f8463269c33127"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "91a9299612eb7afdd09978e04af82deae2ae9ec43b5aec9bef44508c2b48ab0e"
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
