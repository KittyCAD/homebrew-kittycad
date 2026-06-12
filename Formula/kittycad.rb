class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.177/kittycad-cli.tar.gz"
  sha256 "f87c9f0e51e7c750e828eacde80236a97ed5e1a0518eca5da2bae494674baf62"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "fdd4712f952b2ddc9229ac75ceba7aa4ddc825264d4fc207fb5cb2d4e3a96fbd"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "3338c707483efe2b593b05eb69d8d42a466684581b8cd7eac4c228eb7796da5e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "923bab7f0a91a9b55b7048e17f65d93cd35604acbb52b93ba0df87cf661d0152"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "b66adc007c6074726e0f8cc4bb844df0c444eb90942aa2746d9c477cbcec17ef"
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
