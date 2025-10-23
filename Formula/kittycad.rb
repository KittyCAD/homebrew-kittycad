class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.127/kittycad-cli.tar.gz"
  sha256 "1e18390105e246f778ca4eb182536e0e8e7b1d994912ff3273537684ccb8c5c0"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "cb3807a0e8fb49f7ef2d4f9ee5d454a225ed66b30459cd5010c6d38902211cc9"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "4f40cff6504f1e4ed750b857c645f18c429949c17eea712672e8c563c7a70840"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "be37c4ccd752495ab60212734561c1ee1bb5ac79842ee40a60515cb0a2384f9c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "c2b55e30ecdb01f4fb66bad957ffe26dc599f95a7c71bb88d670159795eedea8"
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
