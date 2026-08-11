class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.188/kittycad-cli.tar.gz"
  sha256 "a9edacf54bf4e564655d5e2d7f11d4277b66b8d9451b33de8cfa74cfe96b2177"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "5c488eca7de6946d74d7134a51d0f2371a1aab62c79963f600f30d90fb70d613"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "bfecc4c49eb77c5c23befb157d9f6fa0b6cf3a021d9382aa23fabd13ae4daa4d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7ae211f457b35819d501a7e9b04260ea3a99c0899f6e2e36f3c7dbc5d01bf5bc"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3362ccb9510e58f1ab05beb9d0ae88b85ce78b1146d41e3133cfa21df0e4856d"
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
