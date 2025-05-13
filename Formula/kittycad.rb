class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.112/kittycad-cli.tar.gz"
  sha256 "5a6ed39185b59adf1067607e6c333b7dc5fc185e7df40367e42904ad0f91b98a"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "19b83250c0b879555f0b6b3fb666e5763c8ed4a2771e74badb8b28c4e50dc2dc"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "6f4a3443c0fbad8347a5de146ca738b0827f930b5142b03b9b3b80015549cadd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "582b2d9ffaf6ea11d2b25f263c99853a4d1e746477d28c47ff2e7a94abfb0406"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "40d82e382de4c4dff652dcaf67d201ca7f1d2a8a480fb638c0bc452e1697e22f"
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
