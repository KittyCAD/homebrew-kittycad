class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.209/kittycad-cli.tar.gz"
  sha256 "2b7792fb6a4224c956941902c9452bcd69bbf51b5cbc5b3e8426264d2a83f441"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a556abe1a5fcf1a86424a6f40c20ab971ea25d3c35f77135f195b24f94e21971"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "ac9543fa8e17a2dbe5fbb994a859df3d28aa980160e756b143f65fd1e47df94e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "2857e4b9deb56ce73bc68ab5a53a1f712453c2c9f935ca929ffde7a054de0e51"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "910765b24f0adc19e97005a8d88dc6abd5db09bb4b98fec3c58953b1903f144c"
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
