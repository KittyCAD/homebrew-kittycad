class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.142/kittycad-cli.tar.gz"
  sha256 "16c0e571c100290763dadcaee6fb1e374b8b5630781bb95269639a386a5ad256"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a0d7828d9a40a0efef41c84a484dfa319be4e36e37110e81b92c47f9083f8726"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e9c8d832c59bace0cbb751e6a77574898834a0f23f3345270bdd7aa21a08010c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "2ad57cbec604ad0f5f77fa696307d3c9215498be537f4ed822d4aa939af33051"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "74d402648a70a6c5e126d5b0c4c42524d8a26b3e4e6dbc3dac0b6479509768c9"
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
