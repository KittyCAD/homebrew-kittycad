class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.134/kittycad-cli.tar.gz"
  sha256 "3f0f864260866f3069e08d596d2533b3197db39429adbfdeb85754b4477fa37f"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "1c2ba412496ba552ab9020d9d801c24005a6e2ae9c78492366579105ed3d7662"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "fe3eafaa43787044a00f8414b40ed859f468afe409696881210cc5f8a8cb397d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "64ba2564619de45b567291207df7cbdf28571b0557d77adaf237113d74ab8f82"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "374298616caef338bd15db1b71cd361bdff534e147d1be70ba6ad67b15ea7510"
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
