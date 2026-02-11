class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.146/kittycad-cli.tar.gz"
  sha256 "3315ff41a1ee036898e117d742a8827832de7992666b91e1fcb3e40530df0344"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "1a0a4cb336fd680cac230095cf27693235d96b6f5299194fb9d20d414e10a256"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "15c78310ff2ea68b831ec702b79e3c89ebda63988d6c876dd44c0a39de6f2d79"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "837510d675133b01372824fc99ffb36c87c5b1729b178555b35a44e7efe1f529"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "357fbdedcea6c6d4361c12938d4f31d1ea687e41968ccf74aef430d22c3594bd"
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
