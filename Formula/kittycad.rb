class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.89/kittycad-cli.tar.gz"
  sha256 "204eab5f2eee93d98f2ca92d7df529eaee4434c11d0ed42bb00012e8b2f359bf"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "bdb258deb6a043b08a43544a8e08e726ef9637d59ca8f9b1936dea0319252992"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "58b5311fe353638659c243adcec6aa1af02d923c780d97a8f65f4a8fb745fad9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f41b69e193ad121fc1b898ffe34f5956c3a5636f6e0b8d5c86008ad4571c36c4"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "319c8c4ace02d0c2950697af6491d316a04aeca25fdbce527e689ed20162ea67"
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
