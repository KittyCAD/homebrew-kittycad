class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.210/kittycad-cli.tar.gz"
  sha256 "6af56fc0a39f8105e3892ae710334ec31b647802188e5a5b732a8e9a2a537d99"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "4050cee9cbf36bccfd8210a6d0fdfad0c26ad3e49ae0a16808af9d00ee57ec5f"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "a79b04c200db47480966d71b36891556fab68702604dbaba4f3b520444fcca7e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e1b6a525462ce17702aeb9c410dca1918f7e962cd8c33ca33c98afbd261db838"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "0fb311e9866467ab945d98ac0c8de853d4a139e3f51e9dd32aa67aa68d11f9c6"
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
