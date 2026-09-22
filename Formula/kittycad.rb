class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.198/kittycad-cli.tar.gz"
  sha256 "589297d92a6dc02904e713e291105e596f827e888bf7e3555fe1722b428c5912"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "7197055b35f97fd7b1c6e634bcdc66f94bd02d28254f44f525d23f69ef0a3753"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "bb1ba3ae74478ca06bfb31057cca2dda09ccd741bb6f6008fa0e8c494bf4f96f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "629ef604f7d9b0fd76d9fd2393b5059fd7cae52fc93d5af8d65d2880b612f324"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "c2e2204c7f8123c47e3a39a91718cafab26bb52ff27848766b25aa340219882e"
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
