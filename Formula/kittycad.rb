class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.133/kittycad-cli.tar.gz"
  sha256 "fe977c55ff326f600b8d44a3a8343e2a308ace4b5ad52fe5f5368470f89f4ee9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "9f9db4dfb17efcf123ccccd3aca24556d7c5d25652ae27c621ce56a8fa6cca1c"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "b7c911ed36322cea0737ffa01b8e90d1cc3ddda8d5a99b3b390161be3dc12910"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a62ca30efc3499099cd574c12ee3517457f1008802262f8bc07d5bde43059df5"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "b9ef11a46df073068a7cc86edaf17bacc37f5a24690bdae7de9a2a142a8b8b7a"
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
