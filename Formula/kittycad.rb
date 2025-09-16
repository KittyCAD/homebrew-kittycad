class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.120/kittycad-cli.tar.gz"
  sha256 "4f9ce34be59f9b8957d610eb7c88a0930c38acdbcc57fb6320f9ffc77e715f63"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "df928abdf6656befc013066e22f3c4fa14e67e5f2317aa69f369701b041ffad1"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "7693427121a9835d14f9534b08fc1d4f0a3d0d4e5315b7934147d25fa8906466"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "be164dc4693c6cca4fd040050d619df041795d868eac88b3b6169869ec7f4c77"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "2997b1b2b63d5cfe182f6557427fe33cd7df7ec398c273935589cbda27a76560"
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
