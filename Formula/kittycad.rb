class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.82/kittycad-cli.tar.gz"
  sha256 "46b21a38b9d5c8f4ca0d7af4acd8f26c76dcbf839e6e2ffc7b66411de0943dbf"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "32c88aa62f6035a0f445e191fb56e0ea33dc02b336b5854582fe7e3858d3ecd4"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "d8ae6b4ad3cb126e94354c2ba412424140ec38a81442213edaba84e3d981acfe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "6c5960113db910d9949c6e3a60a3065b47e9f8a274bca23c8649ba211ed34b64"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "1ab60451d5d93dfcb9a21fa2ced6564083d53a84c950774f72a4268700a4a4fd"
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
