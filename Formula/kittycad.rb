class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.194/kittycad-cli.tar.gz"
  sha256 "a52894265bba14649d3b7e03b35a58ecd7ed508aecddfbe05da14eba98e5dc0d"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "2e8571b9e10b8032156b3c2c58d89a323247ee59812703f5f2f26965c4df57e7"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "7911ca1c9cb47f95ed3ab3e3fcf7456bccb1a26d74a2f8d4765f89d601165542"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7abb5702694ae217d14712808066a1b936cf3c320b0d008f10ee2aa5f4cb7d6c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "b594367ce69b74909dd85d830a7f0e2f369615cb48171ce1cc9f7d89473bb8ec"
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
