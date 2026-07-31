class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.186/kittycad-cli.tar.gz"
  sha256 "f7fe8a8ae79586fe1af30d35a075e50c17e783534a0b6bc6cc995c7e94523ab8"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "c32d9f40935fe36945607eb4be265963df067d2fea60554f9261d6e2290d936a"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "192607e7a75ab81c3944b31b9fd875ef0b83d0e0fab952e4f1b74f6c1e8c596e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1edf1edbfbb5d70ebee6ed5e47d7b68322118beb272bf8e9f688a2c30586cccf"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "8334057c663cd8984a85b59f31a478c6522800a4113fdc6750d39772867c765d"
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
