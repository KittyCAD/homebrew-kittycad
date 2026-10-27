class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.207/kittycad-cli.tar.gz"
  sha256 "0dc9ac2905add2b06dbb96efffa86c79d13c07f83dc6c4fd114ca0d5630959e6"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "7786a750b42265aff4abc07e9c85239e55c5d353d79b7c70004bfb7311690504"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "d3f0bd55aa3e69c582f69b4f65d86a60c3a7ae50dd5efe87d11b5b569d943a47"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3d3b40a9e75ac0a7b2d42d9b97b16af36a6a6cb648a6e67dc4d90e269ccea257"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "71eef56a6987e6f350f3b56acf07de0f3a07667b544f81a9e8effe3ae6ff1e1f"
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
