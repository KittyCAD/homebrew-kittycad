class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.149/kittycad-cli.tar.gz"
  sha256 "cdc2b4ec078f532b1e385f6a34c718bf7a7dae6718b52bd1ef5a44c54ec127fd"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "6c02e7d16d561a53414924858666a4bef8bedd8d7c2a0bb21cf7abe78c185dd8"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "2361141da0412fe3e4f9e3af7f01b4dc0337f3175127cd1115873ce96f488d99"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b832d64dd8a03179b8c2ec0932e5c278503388a55417d45cf94fdea3234d12e9"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "712cc20a311b3d791ecee07af4211a259016b5e58648ac0551cfdcbc3466d2aa"
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
