class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.75/kittycad-cli.tar.gz"
  sha256 "f090bb9475b9fb60a7de62555989c7238a689c657d1b32af2a8f5460c09e7c0d"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "934d22a24c46cd5ee40d91ec29719d1b63081c4b6916f5348bf39253d3c2ec99"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "647d1bd02916d438b9393c625c4ffdd1f54017a6ba4a251d22671398963056d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c2ca52c5861fa93c425906db1730201704d99ae64431c7ef50349b35f5c79c7d"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "aec83a63cc0ddfcbe81b95d2194001af34b13f46d5de03c98f654abde07c2741"
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
