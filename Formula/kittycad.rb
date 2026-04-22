class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.160/kittycad-cli.tar.gz"
  sha256 "36e71654cb0417fb27252ab73f9aab7533c8f58be65a9511a35d0dcedd01ba4a"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "1b439b643f5a0f9db1b40d3927bc400e70d18f04eba47f1bd3874d0d1cd54dcf"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "84ea52344a1263b88be1ccf0d0ee38f8a0c99a6d423fe3e69b9ea69ca30d36e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "2e7847cc7a77ac2116baac9cafc957cc51b694176e5f710710f7b6aab86d1174"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "88fdd2db8c9efd78896c370dc89c600cc71f876611b3d9f47194e90c48bdd66e"
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
