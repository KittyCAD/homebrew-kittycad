class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.212/kittycad-cli.tar.gz"
  sha256 "c2b19cbddd632e0c09c8cf4c403002b9bc34c941e0000598c227b3a5544278ae"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "dd2715a53b29e72700ddadb212c6a9cc047c0a1a9be70541c2c0d13aa195335f"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "03cc2ac97b3c6a49b9848bbcc575e3754720609237639370a593db379c97c685"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c7a350d7e50663647e68f632ec24e0926a416d87e42366d54d23c43ac91293ea"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "5f68fcd80d539a77be3652211b50eec2a1f2f56391cffa113328521fb545dee5"
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
