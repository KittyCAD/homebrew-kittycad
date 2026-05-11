class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.165/kittycad-cli.tar.gz"
  sha256 "9bc354168cd841d8138a373bdc558be4d2d8ac18de6ed8fa8c9cc19c6c9954ac"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "34ea6a1dd1d36890f322101d95595b64ef3e7ee3a73f691c1d4e31eb795760ab"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "47c2bb3f922c2b2590380f63edd87a00281a153c800d8ca2ac63bec88d030b2c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c1da1587290232f8f6dc76562e3425c595796ba9b5afe706da0768eaf6f6f675"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "8a6cb66e2eb8defcb402d2fe0d80a74801379a736806071759eae5d3414e6cf4"
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
