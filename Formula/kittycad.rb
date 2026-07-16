class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.183/kittycad-cli.tar.gz"
  sha256 "293b0c223ce447481994ddb61afeb1657a4e9880b87a8675af9785b5395bc4c9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "5c5687e74ec3ecf195e8ff2c22e2f403325e58bd62a2308f42d1939b2943cf1b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "18b40a46a4da274ab6f82b415a8f9c458abb74a89d2d44f6a44d46fbd84db75e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e4523210a0fdcfbe846c6bfe29e98896d2ce840f0a917d73bc7cf3112a232363"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "abe266dd5df7fffe7d65784d180b4a0b0883395a771548eba16c87da7607ba40"
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
